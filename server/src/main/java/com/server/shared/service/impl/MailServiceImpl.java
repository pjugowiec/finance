package com.server.shared.service.impl;

import com.server.shared.model.MailModel;
import com.server.shared.repository.ParamRepository;
import com.server.shared.service.MailService;
import lombok.AllArgsConstructor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import static com.server.shared.model.ParamValues.MAIL_USERNAME;

@Service
@AllArgsConstructor
public class MailServiceImpl implements MailService {

    private final JavaMailSender emailSender;
    private final ParamRepository paramRepository;

    @Override
    public void sendMail(final MailModel model) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(paramRepository.findValueByName(MAIL_USERNAME));
        message.setTo(model.to());
        message.setSubject(model.title());
        message.setText(model.body());
        emailSender.send(message);
    }
}
