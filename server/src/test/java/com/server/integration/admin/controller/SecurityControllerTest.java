package com.server.integration.admin.controller;

import annotation.SqlTruncate;
import com.server.admin.model.RegisterRequest;
import com.server.admin.repository.UserRepository;
import com.server.helpers.RequestConfig;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.server.LocalServerPort;

import static io.restassured.RestAssured.given;
import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@SqlTruncate
class SecurityControllerTest {

    @Autowired
    private UserRepository userRepository;

    @LocalServerPort
    private Integer port;

    private RequestSpecification requestSpecification;

    @BeforeEach
    void init() {
        requestSpecification = RequestConfig.createBasicRequestSpecification(port);
    }

    @Test
    void registerUser_ShouldRegisterNewUser() {
        final RegisterRequest registerRequest = new RegisterRequest("test1@test", "12345678");

        final Response response = given(requestSpecification)
                .body(registerRequest)
                .post("/register")
                .andReturn();

        assertEquals(202, response.getStatusCode());
        assertEquals(1, userRepository.count());

    }
}
