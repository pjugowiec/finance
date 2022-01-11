package com.server.shared.config;

import com.server.shared.repository.ParamRepository;
import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

import static com.server.shared.model.ParamValues.MAIL_PASSWORD;
import static com.server.shared.model.ParamValues.MAIL_USERNAME;

@Configuration
@AllArgsConstructor
public class MailerConfig {

    public static final String MAIL_TITLE = "TITLE";
    public static final String MAIL_BODY = "BODY";

    private final ParamRepository paramRepository;

    @Bean
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);

        mailSender.setUsername(paramRepository.findValueByName(MAIL_USERNAME));
        mailSender.setPassword(paramRepository.findValueByName(MAIL_PASSWORD));

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");

        return mailSender;
    }
}
