package com.server.balance.service.impl;

import com.server.admin.service.SecurityUserDetailsService;
import com.server.balance.entity.BalanceTransactionEntity;
import com.server.balance.entity.CategoryEntity;
import com.server.balance.model.Balance;
import com.server.balance.model.BalanceSummary;
import com.server.balance.model.Transaction;
import com.server.balance.model.TransactionRequest;
import com.server.balance.repostiory.BalanceTransactionRepository;
import com.server.balance.repostiory.CategoryRepository;
import com.server.balance.repostiory.CurrencyRepository;
import com.server.balance.service.BalanceService;
import com.server.shared.entity.CurrencyEntity;
import com.server.shared.exceptions.ValidationException;
import com.server.shared.util.CommonErrorMessage;
import com.server.shared.util.SortUtil;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class BalanceServiceImpl implements BalanceService {

    private final BalanceTransactionRepository balanceTransactionRepository;
    private final CategoryRepository categoryRepository;
    private final CurrencyRepository currencyRepository;
    private final SecurityUserDetailsService securityUserDetailsService;

    @Override
    @Transactional
    public Balance addBalance(final Balance balance) {

        final CategoryEntity categoryEntity = categoryRepository.getById(balance.categoryId());

        final CurrencyEntity currencyEntity = currencyRepository.getById(CurrencyEntity.POLISH_ID);

        BalanceTransactionEntity entity = BalanceTransactionEntity.builder()
                .balanceFlow(balance.balanceFlow())
                .balance(balance.balance())
                .description(balance.description())
                .categoryEntity(categoryEntity)
                .userEntity(securityUserDetailsService.getCurrentUser())
                .currencyEntity(currencyEntity)
                .created(LocalDateTime.now())
                .transactionDate(balance.date())
                .build();

        balanceTransactionRepository.save(entity);

        return balance;
    }

    @Override
    public BalanceSummary getSummary(final String username) {
        final BalanceSummary balanceSummary = balanceTransactionRepository.getSummary(username);
        if (balanceSummary == null || balanceSummary.balance() == null)
            return new BalanceSummary(BigDecimal.valueOf(0.0), BigDecimal.valueOf(0.0), BigDecimal.valueOf(0.000));

        return balanceSummary;
    }

    @Override
    public List<Transaction> getTranslations(final TransactionRequest transactionRequest, final String username) {
        final Sort sort = SortUtil.getSortByParsedSort(transactionRequest.sort());
        final Pageable page = PageRequest.of(0, transactionRequest.count(), sort);

        return balanceTransactionRepository.getTranslations(transactionRequest.from(),
                transactionRequest.to(),
                username,
                transactionRequest.categoriesIds(),
                transactionRequest.minAmount(),
                transactionRequest.maxAmount(),
                page);
    }

    @Override
    public void deleteTransaction(Long id) {
        if (!balanceTransactionRepository.existsById(id)) {
            throw new ValidationException(CommonErrorMessage.NOT_FOUND.name());
        }
        balanceTransactionRepository.deleteById(id);
    }
}
