package com.server.balance.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public record Transaction(Long id, String description, String category, BigDecimal balance, LocalDateTime created) {
}
