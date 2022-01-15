package com.server.unit.admin.service;

import com.server.admin.entity.ForgottenPasswordEntity;
import com.server.admin.entity.UserEntity;
import com.server.admin.model.ForgotPasswordCode;
import com.server.admin.repository.ForgottenPasswordRepository;
import com.server.admin.service.ForgottenPasswordService;
import com.server.admin.service.UserService;
import com.server.admin.service.impl.ForgottenPasswordServiceImpl;
import com.server.admin.util.AdminErrorsMessages;
import com.server.shared.exceptions.ValidationException;
import com.server.shared.service.MailService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Locale;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;

@ExtendWith(MockitoExtension.class)
class ForgottenPasswordServiceTest {

    @Mock
    private MailService mailService;

    @Mock
    private UserService userService;

    @Mock
    private ForgottenPasswordRepository forgottenPasswordRepository;

    private ForgottenPasswordService forgottenPasswordService;

    @BeforeEach
    void init() {
        forgottenPasswordService = new ForgottenPasswordServiceImpl(forgottenPasswordRepository, userService, mailService);
    }


    @Test
    void generateSendCode_ShouldGenerateCode() {

        Mockito.when(userService.findByEmail(any())).thenReturn(new UserEntity());
        Mockito.when(forgottenPasswordRepository.existsByCode(any())).thenReturn(false);

        assertDoesNotThrow(() -> forgottenPasswordService.generateSendCode("test@test", new Locale("pl")));
    }

    @Test
    void validateCode_ShouldDoesNotThrow() {
        Mockito.when(forgottenPasswordRepository.findByCode(any())).thenReturn(ForgottenPasswordEntity.builder()
                .code("0001")
                .build());

        assertDoesNotThrow(() -> forgottenPasswordService.validateCode(new ForgotPasswordCode("0001")));
    }

    @Test
    void validateCode_ShouldThrow() {
        Mockito.when(forgottenPasswordRepository.findByCode(any())).thenReturn(ForgottenPasswordEntity.builder()
                .code("0002")
                .build());

        ValidationException result = assertThrows(ValidationException.class, () -> forgottenPasswordService.validateCode(new ForgotPasswordCode("0001")));

        assertEquals(AdminErrorsMessages.WRONG_RESET_PASSWORD_TOKEN.name(), result.getMessage());
    }

}
