package com.server.helpers;

import io.restassured.filter.log.RequestLoggingFilter;
import io.restassured.specification.RequestSpecification;

import static io.restassured.RestAssured.with;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

public final class RequestConfig {

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
}
