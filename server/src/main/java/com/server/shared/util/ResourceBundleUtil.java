package com.server.shared.util;

import lombok.NoArgsConstructor;

import java.util.Locale;
import java.util.ResourceBundle;

import static lombok.AccessLevel.PRIVATE;

@NoArgsConstructor(access = PRIVATE)
public final class ResourceBundleUtil {

    public static ResourceBundle getResourceBundle(final String path, final Locale locale) {
        return ResourceBundle.getBundle(path, locale);
    }
}
