package com.server.balance.service.impl;

import com.server.admin.service.SecurityUserDetailsService;
import com.server.balance.entity.BalanceTransactionEntity;
import com.server.balance.entity.CategoryEntity;
import com.server.balance.model.Balance;
import com.server.balance.repostiory.BalanceTransactionRepository;
import com.server.balance.repostiory.CategoryRepository;
import com.server.balance.repostiory.CurrencyRepository;
import com.server.balance.service.BalanceService;
import com.server.shared.entity.CurrencyEntity;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

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
}
