package com.server.balance.model;

import java.math.BigDecimal;

public record BalanceSummary(BigDecimal balance, BigDecimal income, BigDecimal expenses) {
}
