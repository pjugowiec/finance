package com.server.balance.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

public record TransactionRequest(@NotNull @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime from,
                                 @NotNull @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime to,
                                 List<Long> categoriesIds,
                                 @NotNull BigDecimal minAmount,
                                 @NotNull BigDecimal maxAmount,
                                 @NotNull Integer count,
                                 @NotNull String sort) {
}
