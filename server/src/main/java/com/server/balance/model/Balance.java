package com.server.balance.model;

import com.server.balance.entity.BalanceFlow;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

public record Balance(@NotNull @DecimalMin(value = "0.1") BigDecimal balance,
                      String description,
                      Long categoryId,
                      BalanceFlow balanceFlow) {
}
