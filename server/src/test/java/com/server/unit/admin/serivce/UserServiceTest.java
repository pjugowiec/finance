package com.server.unit.admin.serivce;

import com.server.admin.entity.Role;
import com.server.admin.entity.UserEntity;
import com.server.admin.model.RegisterRequest;
import com.server.admin.repository.UserRepository;
import com.server.admin.service.UserService;
import com.server.admin.service.impl.UserServiceImpl;
import com.server.admin.util.AdminErrorsMessages;
import com.server.shared.exceptions.ValidationException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;

@ExtendWith(MockitoExtension.class)
class UserServiceTest {

    private UserService userService;

    @Mock
    private UserRepository userRepository;

    @Mock
    private PasswordEncoder passwordEncoder;

    @BeforeEach
    void init() {
        userService = new UserServiceImpl(userRepository, passwordEncoder);
    }


    @Test
    void createUser_ShouldThrowException() {
        final String EMAIL = "test@test";
        Mockito.when(userRepository.findByEmail(EMAIL))
                .thenReturn(Optional.of(UserEntity.builder().email(EMAIL).build()));

        ValidationException exception = assertThrows(ValidationException.class,
                () -> userService.create(new RegisterRequest(EMAIL, "TEST")));

        assertEquals(AdminErrorsMessages.EMAIL_IS_TAKEN.name(), exception.getMessage());
    }

    @Test
    void createUser_ShouldCreateUser() {
        final String EMAIL = "test@test";
        final String PASSWORD = "TESTEST";
        final String ENCODED_PASSWORD = "12332";
        final UserEntity userEntity = UserEntity.builder()
                .email(EMAIL)
                .password(ENCODED_PASSWORD)
                .role(Role.USER)
                .build();

        Mockito.when(userRepository.save(any()))
                .thenReturn(userEntity);

        Mockito.when(passwordEncoder.encode(PASSWORD)).thenReturn(ENCODED_PASSWORD);

        assertDoesNotThrow(() -> userService.create(new RegisterRequest(EMAIL, PASSWORD)));
    }
}