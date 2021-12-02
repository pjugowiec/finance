package com.server.balance.model;

import com.server.balance.entity.BalanceFlow;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public record Transaction(Long id, BalanceFlow type, String description, String category, BigDecimal balance, LocalDateTime created) {
}
