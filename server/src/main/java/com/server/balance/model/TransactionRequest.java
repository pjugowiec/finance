package com.server.balance.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

public record TransactionRequest(@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime from, @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime to, Long count) {
}
