package com.server.admin.service;

import com.server.admin.entity.UserEntity;
import com.server.admin.model.SecurityUserDetails;
import com.server.admin.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class SecurityUserDetailsService implements UserDetailsService {

    private final UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
        // todo
        final UserEntity userEntity = userRepository.findByEmail(username)
                .orElseThrow(() -> new RuntimeException("Nie ma takiego usera"));
        return new SecurityUserDetails(userEntity);
    }
}
