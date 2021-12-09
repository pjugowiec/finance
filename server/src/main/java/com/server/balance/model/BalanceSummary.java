package com.server.balance.model;

import lombok.Builder;

import java.math.BigDecimal;

@Builder
public record BalanceSummary(BigDecimal balance, BigDecimal income, BigDecimal expenses) {
}
