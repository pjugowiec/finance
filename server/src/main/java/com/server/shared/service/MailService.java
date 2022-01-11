package com.server.shared.service;

import com.server.shared.model.MailModel;

public interface MailService {

    void sendMail(final MailModel model);
}
