package com.server.shared.service;

import lombok.AllArgsConstructor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class MailService {

    private final JavaMailSender emailSender;

    public void sendSimpleMessage() {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("test");
        message.setTo("patryk.jugowiec@o2.pl");
        message.setSubject("TEST");
        message.setText("TEST");
        emailSender.send(message);
    }

}
