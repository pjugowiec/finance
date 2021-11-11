package com.server.integration.balance.controller;

import annotation.SqlCategory;
import com.server.admin.repository.UserRepository;
import com.server.helpers.RequestConfig;
import io.restassured.specification.RequestSpecification;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.server.LocalServerPort;

import static com.server.helpers.RequestConfig.PASSWORD_USER_1;
import static com.server.helpers.RequestConfig.USERNAME_USER_1;
import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.is;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@SqlCategory
class CategoryControllerTest {

    @Autowired
    private UserRepository userRepository;

    @LocalServerPort
    private Integer port;

    private RequestSpecification requestSpecification;

    @BeforeEach
    void init() {
        requestSpecification = RequestConfig.createRequestWithJwtToken(USERNAME_USER_1, PASSWORD_USER_1, port);
    }

    @Test
    void getCategories_ShouldReturnData() {
        given(requestSpecification)
                .get("/category")
                .then()
                .body("$.size()", is(2));
    }

}
