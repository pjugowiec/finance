package com.server.unit.shared.service;

import com.server.shared.model.MailModel;
import com.server.shared.repository.ParamRepository;
import com.server.shared.service.MailService;
import com.server.shared.service.impl.MailServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;

@ExtendWith(MockitoExtension.class)
final class MailServiceTest {

    @Mock
    private JavaMailSender javaMailSender;

    @Mock
    private ParamRepository paramRepository;

    private MailService mailService;

    @BeforeEach
    void init() {
        mailService = new MailServiceImpl(javaMailSender, paramRepository);
    }

    @Test
    void sendMail_ShouldSendMail() {
        final String test = "test";
        final MailModel mailModel = MailModel.builder()
                .body(test)
                .title(test)
                .to(test)
                .build();
        SimpleMailMessage mime = new SimpleMailMessage();
        mime.setFrom(test);
        mime.setSubject(test);
        mime.setTo(test);
        mime.setText(test);

        Mockito.when(paramRepository.findValueByName(Mockito.any())).thenReturn(test);

        assertDoesNotThrow(() -> mailService.sendMail(mailModel));
    }
}
