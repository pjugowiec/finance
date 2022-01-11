package com.server.integration.balance.controller;

import annotation.SqlBalance;
import com.server.helpers.RequestConfig;
import io.restassured.specification.RequestSpecification;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.server.LocalServerPort;

import static org.hamcrest.Matchers.is;

import static com.server.helpers.RequestConfig.PASSWORD_USER_1;
import static com.server.helpers.RequestConfig.USERNAME_USER_1;
import static io.restassured.RestAssured.given;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@SqlBalance
class ReportController {

    @LocalServerPort
    private Integer port;

    private RequestSpecification requestSpecification;

    @BeforeEach
    void init() {
        requestSpecification = RequestConfig.createRequestWithJwtToken(USERNAME_USER_1, PASSWORD_USER_1, port);
    }

    @Test
    void categoryReport_ShouldReturnCorrectData() {

        given(requestSpecification)
                .get("/report/category")
                .then()
                .assertThat()
                .statusCode(200)
                .body("$.size()", is(2));
    }


    @Test
    void incomeExpensesYearReport_ShouldReturnCorrectData() {

        given(requestSpecification)
                .get("/report/balance/{year}", 2021)
                .then()
                .assertThat()
                .statusCode(200)
                .body("$.size()", is(2));
    }
}
