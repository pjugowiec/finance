package com.server.admin.service.impl;

import com.server.admin.entity.ForgottenPasswordEntity;
import com.server.admin.entity.UserEntity;
import com.server.admin.model.ForgotPasswordCode;
import com.server.admin.repository.ForgottenPasswordRepository;
import com.server.admin.repository.UserRepository;
import com.server.admin.service.ForgottenPasswordService;
import com.server.admin.service.UserService;
import com.server.admin.util.AdminErrorsMessages;
import com.server.shared.exceptions.ValidationException;
import com.server.shared.model.MailModel;
import com.server.shared.service.MailService;
import com.server.shared.util.ResourceBundleUtil;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalAmount;
import java.time.temporal.TemporalUnit;
import java.util.List;
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
    private final UserService userService;
    private final MailService mailService;

    @Override
    @Transactional
    public void generateSendCode(final String email, final Locale locale) {

        final UserEntity userEntity = userService.findByEmail(email);

        final ResourceBundle resourceBundle =
                ResourceBundleUtil.getResourceBundle("messages.forgotten_password", locale);

        String generatedCode = generateCode();
        while (forgottenPasswordRepository.existsByCode(generatedCode)) {
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
    @Transactional
    public void validateCode(final ForgotPasswordCode forgotPasswordCode) {

        final ForgottenPasswordEntity entity = forgottenPasswordRepository.findByCode(forgotPasswordCode.code());

        if (!forgotPasswordCode.code().equals(entity.getCode())) {
            throw new ValidationException(AdminErrorsMessages.WRONG_RESET_PASSWORD_TOKEN.name());
        }

        entity.setValidTo(LocalDateTime.now());
    }

    @Scheduled(cron = "0 0/15 * * * *")
    @Transactional
    public void expireCodeOlderThan() {
        final LocalDateTime olderThan = LocalDateTime.now().minus(15, ChronoUnit.MINUTES);

        List<ForgottenPasswordEntity> collectionOfOldersThan = forgottenPasswordRepository.findAllOlderThan15Minutes(olderThan);
        collectionOfOldersThan.forEach(v -> v.setValidTo(LocalDateTime.now()));
    }

}
