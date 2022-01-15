package com.server.admin.service.impl;

import com.server.admin.entity.Role;
import com.server.admin.entity.UserEntity;
import com.server.admin.model.ChangePasswordRequest;
import com.server.admin.model.RegisterRequest;
import com.server.admin.repository.UserRepository;
import com.server.admin.service.UserService;
import com.server.admin.util.AdminErrorsMessages;
import com.server.shared.exceptions.ValidationException;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import static com.server.admin.util.AdminErrorsMessages.EMAIL_IS_TAKEN;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @Override
    @Transactional
    public void create(final RegisterRequest registerRequest) {
        if(userRepository.findByEmail(registerRequest.email()).isPresent()) throw new ValidationException(EMAIL_IS_TAKEN.name());

        UserEntity userEntity = UserEntity.builder()
                .email(registerRequest.email())
                .password(passwordEncoder.encode(registerRequest.password()))
                .role(Role.USER)
                .build();

        userRepository.save(userEntity);
    }

    @Override
    @Transactional
    public void changePassword(final ChangePasswordRequest changePasswordRequest) {
        final UserEntity userEntity = userRepository.findByEmail(changePasswordRequest.email())
                .orElseThrow(() -> new ValidationException(AdminErrorsMessages.USER_NOT_FOUND.name()));

        userEntity.setPassword(passwordEncoder.encode(changePasswordRequest.newPassword()));
    }

    @Override
    public UserEntity findByEmail(String email) {
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new ValidationException(AdminErrorsMessages.USER_NOT_FOUND.name()));
    }
}
