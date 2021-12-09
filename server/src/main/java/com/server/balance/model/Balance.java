package com.server.balance.model;

import com.server.balance.entity.BalanceFlow;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.time.LocalDateTime;

public record Balance(@NotNull @DecimalMin(value = "0.1") BigDecimal balance,
                      String description,
                      Long categoryId,
                      BalanceFlow balanceFlow,
                      @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime date) {
}
