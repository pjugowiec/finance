package com.server.integration.balance.controller;

import annotation.SqlBalance;
import com.server.balance.entity.BalanceFlow;
import com.server.balance.entity.BalanceTransactionEntity;
import com.server.balance.model.Balance;
import com.server.balance.repostiory.BalanceTransactionRepository;
import com.server.helpers.RequestConfig;
import io.restassured.specification.RequestSpecification;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.server.LocalServerPort;

import java.math.BigDecimal;

import static com.server.helpers.RequestConfig.PASSWORD_USER_1;
import static com.server.helpers.RequestConfig.USERNAME_USER_1;
import static io.restassured.RestAssured.given;
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
        final Balance balance = new Balance(new BigDecimal("23.45"), "TEST", 1000L, BalanceFlow.INCOME);

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
        assertNotNull(entity.getCreated());
    }
}
