package com.server.admin.service.impl;

import com.server.admin.entity.ForgottenPasswordEntity;
import com.server.admin.entity.UserEntity;
import com.server.admin.model.ForgotPasswordCode;
import com.server.admin.repository.ForgottenPasswordRepository;
import com.server.admin.repository.UserRepository;
import com.server.admin.service.ForgottenPasswordService;
import com.server.admin.util.AdminErrorsMessages;
import com.server.shared.exceptions.ValidationException;
import com.server.shared.model.MailModel;
import com.server.shared.service.impl.MailServiceImpl;
import com.server.shared.util.ResourceBundleUtil;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.Locale;
import java.util.Random;
import java.util.ResourceBundle;

import static com.server.shared.config.MailerConfig.MAIL_BODY;
import static com.server.shared.config.MailerConfig.MAIL_TITLE;

@Service
@Slf4j
@AllArgsConstructor
public class ForgottenPasswordServiceImpl implements ForgottenPasswordService {

    private final ForgottenPasswordRepository forgottenPasswordRepository;
    private final UserRepository userRepository;
    private final MailServiceImpl mailService;

    @Override
    @Transactional
    public void generateSendCode(final String email, final Locale locale) {
        final UserEntity userEntity = userRepository.findByEmail(email)
                .orElseThrow(() -> new ValidationException(AdminErrorsMessages.USER_NOT_FOUND.name()));

        final ResourceBundle resourceBundle =
                ResourceBundleUtil.getResourceBundle("messages.forgotten_password", locale);

        String generatedCode = generateCode();
        while(forgottenPasswordRepository.existsByCode(generatedCode)) {
            generatedCode = generateCode();
        }

        final ForgottenPasswordEntity forgottenPasswordEntity = ForgottenPasswordEntity.builder()
                .code(generatedCode)
                .userEntity(userEntity)
                .validFrom(LocalDateTime.now())
                .build();

        forgottenPasswordRepository.save(forgottenPasswordEntity);

        final MailModel model = MailModel.builder()
                .to(email)
                .title(resourceBundle.getString(MAIL_TITLE))
                .body(String.format(resourceBundle.getString(MAIL_BODY), generatedCode))
                .build();

        mailService.sendMail(model);
        log.info(String.format("Send mail with code to %s", email));
    }

    private String generateCode() {
        return String.valueOf(new Random().nextInt(100000) + 10000);
    }

    @Override
    public void validateCode(final ForgotPasswordCode forgotPasswordCode) {
        final UserEntity userEntity = userRepository.findByEmail(forgotPasswordCode.email())
                .orElseThrow(() -> new ValidationException(AdminErrorsMessages.USER_NOT_FOUND.name()));

        final String code = forgottenPasswordRepository.findLastUserCode(userEntity.getId());

        if(!forgotPasswordCode.code().equals(code)) {
            throw new ValidationException(AdminErrorsMessages.WRONG_RESET_PASSWORD_TOKEN.name());
        }
    }

}
