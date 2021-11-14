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
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
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
                .build();
        balanceTransactionRepository.save(entity);

        return balance;
    }

    @Override
    public BalanceSummary getSummary(final String username) {
        return balanceTransactionRepository.getSummary(username);
    }

    @Override
    public List<Transaction> getTranslations(TransactionRequest transactionRequest, String username) {
        Pageable page = PageRequest.of(0, transactionRequest.count());

        return balanceTransactionRepository.getTranslations(transactionRequest.from(), transactionRequest.to(), username, page);
    }

    @Override
    public void deleteTransaction(Long id) {
        if(!balanceTransactionRepository.existsById(id)) {
            throw new ValidationException(CommonErrorMessage.NOT_FOUND.name());
        }
        balanceTransactionRepository.deleteById(id);
    }
}