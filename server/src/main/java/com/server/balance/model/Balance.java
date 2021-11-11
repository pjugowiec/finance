package com.server.balance.model;

import com.server.balance.entity.BalanceFlow;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

public record Balance(@NotNull @Min(value = 0) BigDecimal balance,
                      String description,
                      Long categoryId,
                      BalanceFlow balanceFlow) {
}
