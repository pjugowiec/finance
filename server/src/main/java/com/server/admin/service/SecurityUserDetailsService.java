package com.server.admin.service;

import com.server.admin.entity.UserEntity;
import com.server.admin.model.SecurityUserDetails;
import com.server.admin.repository.UserRepository;
import com.server.admin.util.AdminErrorsMessages;
import com.server.shared.exceptions.ValidationException;
import lombok.AllArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import static com.server.admin.util.AdminErrorsMessages.USER_NOT_FOUND;

@Component
@AllArgsConstructor
public class SecurityUserDetailsService implements UserDetailsService {

    private final UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
        final UserEntity userEntity = userRepository.findByEmail(username)
                .orElseThrow(() -> new UsernameNotFoundException(USER_NOT_FOUND.name()));
        return new SecurityUserDetails(userEntity);
    }

    public UserEntity getCurrentUser() {
        final String username = SecurityContextHolder.getContext().getAuthentication().getName();

        return userRepository.findByEmail(username)
                .orElseThrow(() -> new ValidationException(AdminErrorsMessages.USER_NOT_FOUND.name()));
    }
}
