package com.server.admin.service;

import com.server.admin.model.ForgotPasswordCode;

import java.util.Locale;

public interface ForgottenPasswordService {

    void generateSendCode(final String email, final Locale locale);

    void validateCode(final ForgotPasswordCode forgotPasswordCode);
}
