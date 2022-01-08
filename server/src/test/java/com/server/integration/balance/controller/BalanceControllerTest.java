package com.server.integration.balance.controller;

import annotation.SqlBalance;
import com.server.balance.entity.BalanceFlow;
import com.server.balance.entity.BalanceTransactionEntity;
import com.server.balance.model.Balance;
import com.server.balance.model.BalanceSummary;
import com.server.balance.repostiory.BalanceTransactionRepository;
import com.server.helpers.RequestConfig;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.server.LocalServerPort;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import static com.server.helpers.RequestConfig.PASSWORD_USER_1;
import static com.server.helpers.RequestConfig.USERNAME_USER_1;
import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.is;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@SqlBalance
class BalanceControllerTest {

    @Autowired
    private BalanceTransactionRepository balanceTransactionRepository;

    @LocalServerPort
    private Integer port;

    private RequestSpecification requestSpecification;

    @BeforeEach
    void init() {
        requestSpecification = RequestConfig.createRequestWithJwtToken(USERNAME_USER_1, PASSWORD_USER_1, port);
    }

    @Test
    void addBalance_ShouldAddBalance() {
        final LocalDateTime date = LocalDateTime.parse("2021-11-11T10:29:10");
        final Balance balance = new Balance(new BigDecimal("23.45"), "TEST", 1000L, BalanceFlow.INCOME, date);

        given(requestSpecification)
                .body(balance)
                .post("/balance")
                .then()
                .assertThat()
                .statusCode(200);


        assertEquals(3, balanceTransactionRepository.count());

        final BalanceTransactionEntity entity = balanceTransactionRepository.findById(1L).orElseThrow();

        assertEquals(balance.balance(), entity.getBalance());
        assertEquals(balance.balanceFlow(), entity.getBalanceFlow());
        assertEquals(balance.description(), entity.getDescription());
        assertEquals(date, entity.getTransactionDate());
        assertNotNull(entity.getCreated());
    }

    @Test
    void getSummary_ShouldReturnSummary() {

        requestSpecification = RequestConfig.createRequestWithJwtToken("test1@test", PASSWORD_USER_1, port);
        final Response response = given(requestSpecification)
                .get("/balance")
                .andReturn();

        assertEquals(200, response.getStatusCode());

        final BalanceSummary summary = response.getBody().as(BalanceSummary.class);

        assertEquals(new BigDecimal("0.0"), summary.income());
        assertEquals(new BigDecimal("0.0"), summary.expenses());
        assertEquals(new BigDecimal("0.0"), summary.balance());
    }

    @Test
    void getSummary_ShouldReturnEmptySummary() {

        final Response response = given(requestSpecification)
                .get("/balance")
                .andReturn();

        assertEquals(200, response.getStatusCode());

        final BalanceSummary summary = response.getBody().as(BalanceSummary.class);

        assertEquals(new BigDecimal("500.23"), summary.income());
        assertEquals(new BigDecimal("400.00"), summary.expenses());
        assertEquals(new BigDecimal("900.23"), summary.balance());
    }

    @Test
    void getTransactions_ShouldReturnTransactionsByRange() {

        given(requestSpecification)
                .param("from", "2021-11-11T10:29:10")
                .param("to", "2021-11-11T10:30:40")
                .param("count", 10)
                .param("categoriesIds", 1000L,1001L)
                .param("minAmount", BigDecimal.valueOf(0.0))
                .param("maxAmount", BigDecimal.valueOf(5000.0))
                .param("sort", "date")
                .get("/balance/transactions")
                .then()
                .statusCode(200)
                .body("$.size()", is(1));
    }

    @Test
    void deleteTransaction_ShouldDeleteRecord() {
        final long count = balanceTransactionRepository.count();

        given(requestSpecification)
                .delete("/balance/transactions/{id}", 1000L)
                .then()
                .statusCode(204);

        assertEquals(count - 1, balanceTransactionRepository.count());
    }
}
