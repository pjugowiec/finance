package com.server.integration.admin.security;

import annotation.SqlSecurity;
import com.server.helpers.template.RequestTemplate;
import io.restassured.http.Header;
import io.restassured.response.Response;
import org.junit.jupiter.api.Test;

import java.util.Optional;

import static com.server.admin.util.CommonValues.TOKEN_AUTHORIZATION;
import static com.server.admin.util.CommonValues.TOKEN_PREFIX;
import static io.restassured.RestAssured.given;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

@SqlSecurity
class JwtTokenTest extends RequestTemplate {

    @Test
    void generateJwtToken_ShouldLoginAndReturnJwtToken() {

        Response response = given(requestSpecification)
                .auth()
                .basic("test@test", "test")
                .post("/login")
                .andReturn();


        assertEquals(200, response.getStatusCode());
        final Optional<Header> JWT_TOKEN = response.getHeaders().asList()
                .stream()
                .filter(v -> TOKEN_AUTHORIZATION.equals(v.getName()))
                .findAny();

        assertTrue(JWT_TOKEN.isPresent());
        assertTrue(JWT_TOKEN.get().getValue().startsWith(TOKEN_PREFIX));
    }
}
