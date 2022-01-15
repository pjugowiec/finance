package com.server.unit.shared.util;

import com.server.shared.util.ResourceBundleUtil;
import org.junit.jupiter.api.Test;

import java.util.Locale;
import java.util.ResourceBundle;

import static org.junit.jupiter.api.Assertions.assertNotNull;


final class ResourceBundleUtilTest {


    @Test
    void shouldReturnResourceBundle() {
        final ResourceBundle result = ResourceBundleUtil.getResourceBundle("messages.forgotten_password",
                new Locale("pl"));

        assertNotNull(result);
    }
}
