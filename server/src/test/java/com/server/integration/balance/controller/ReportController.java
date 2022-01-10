package com.server.integration.balance.controller;

import annotation.SqlBalance;
import com.server.balance.model.reports.CategoryReportModel;
import com.server.helpers.RequestConfig;
import io.restassured.specification.RequestSpecification;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.server.LocalServerPort;

import java.util.List;

import static java.util.Arrays.asList;
import static org.hamcrest.Matchers.is;

import static com.server.helpers.RequestConfig.PASSWORD_USER_1;
import static com.server.helpers.RequestConfig.USERNAME_USER_1;
import static io.restassured.RestAssured.given;
import static org.junit.jupiter.api.Assertions.assertEquals;

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
}
