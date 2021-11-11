package com.server.balance.service;

import com.server.balance.model.Balance;
import com.server.balance.model.BalanceSummary;

public interface BalanceService {

    Balance addBalance(final Balance balance);

    BalanceSummary getSummary(final String username);
}
