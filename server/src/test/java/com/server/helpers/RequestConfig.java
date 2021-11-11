package com.server.helpers;

import com.server.admin.entity.Role;
import io.restassured.filter.log.RequestLoggingFilter;
import io.restassured.specification.RequestSpecification;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Component;

import java.util.Arrays;

import static io.restassured.RestAssured.with;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

public final class RequestConfig {

    public static final String USERNAME_USER_1 = "test@test";
    public static final String PASSWORD_USER_1 = "test";
    private static final String ROLE_PREFIX = "ROLE_";


    public static RequestSpecification createRequestWithJwtToken(final String username, final String pass, final Integer port) {
        return with()
                .baseUri("http://localhost")
                .port(port)
                .auth()
                .basic(username, pass)
                .accept(APPLICATION_JSON_VALUE)
                .contentType(APPLICATION_JSON_VALUE)
                .filter(new RequestLoggingFilter());

    }

    public static RequestSpecification createBasicRequestSpecification(final Integer port) {
        return with()
                .baseUri("http://localhost")
                .port(port)
                .accept(APPLICATION_JSON_VALUE)
                .contentType(APPLICATION_JSON_VALUE)
                .filter(new RequestLoggingFilter());
    }

    public static void fakeAuthenticate(final String username, final Role role) {
        final Authentication authentication =
                new UsernamePasswordAuthenticationToken(username, null, Arrays.asList(new SimpleGrantedAuthority(ROLE_PREFIX + role.name())));
        SecurityContext securityContext = new SecurityContextImpl();
        securityContext.setAuthentication(authentication);
        SecurityContextHolder.setContext(securityContext);
    }
}
