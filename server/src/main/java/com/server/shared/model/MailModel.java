package com.server.shared.model;

import lombok.Builder;

public record MailModel(String to, String title, String body) {

    @Builder
    public MailModel{}
}
