package com.server.shared.config;

import com.server.shared.exceptions.ValidationException;
import com.server.shared.util.CommonErrorMessage;
import lombok.NoArgsConstructor;

import java.util.Locale;
import java.util.Map;

import static lombok.AccessLevel.PRIVATE;

@NoArgsConstructor(access = PRIVATE)
public final class LangConfig {

    private static final Map<String, Locale> SUPPORTED_LANG = Map.of(
            "en", new Locale("en"),
            "pl", new Locale("pl")
    );

    public static Locale getLocale(final String lang) {
        final Locale locale = SUPPORTED_LANG.get(lang);
        if(locale == null) {
            throw new ValidationException(CommonErrorMessage.NOT_SUPPORTED_LANG.name());
        }
        return locale;
    }
}
