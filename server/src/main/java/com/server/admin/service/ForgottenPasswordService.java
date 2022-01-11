package com.server.admin.service;

import java.util.Locale;

public interface ForgottenPasswordService {

    void generateSendCode(final String email, final Locale locale);
}
