package com.server.balance.service;

import com.server.balance.model.Balance;
import com.server.balance.model.BalanceSummary;
import com.server.balance.model.Transaction;
import com.server.balance.model.TransactionRequest;

import java.util.List;

public interface BalanceService {

    Balance addBalance(final Balance balance);

    BalanceSummary getSummary(final String username);

    List<Transaction> getTranslations(final TransactionRequest transactionRequest, final String username);

    void deleteTransaction(final Long id);
}
