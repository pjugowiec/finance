package com.server.integration.admin.security;

import annotation.SqlSecurity;
import com.server.helpers.RequestConfig;
import io.restassured.http.Header;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.server.LocalServerPort;

import java.util.Optional;

import static com.server.admin.util.CommonValues.TOKEN_AUTHORIZATION;
import static com.server.admin.util.CommonValues.TOKEN_PREFIX;
import static io.restassured.RestAssured.given;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

@SqlSecurity
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class JwtTokenTest {

    @LocalServerPort
    protected Integer port;

    protected RequestSpecification requestSpecification;

    @BeforeEach
    void init() {
        requestSpecification = RequestConfig.createBasicRequestSpecification(port);
    }

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

    @Test
    void checkJwtToken_ShouldAcceptRequest() {
        Response response = given(requestSpecification)
                .auth()
                .basic("test@test", "test")
                .post("/login")
                .andReturn();


        assertEquals(200, response.getStatusCode());
        final String JWT_TOKEN = response.getHeaders().asList()
                .stream()
                .filter(v -> TOKEN_AUTHORIZATION.equals(v.getName()))
                .findAny()
                .get()
                .getValue();

        //TODO change endpoint
        requestSpecification
                .header(TOKEN_AUTHORIZATION, JWT_TOKEN)
                .get("/category")
                .then()
                .assertThat()
                .statusCode(200);
    }
}
