package com.server.unit.balance.service;

import com.server.admin.service.SecurityUserDetailsService;
import com.server.balance.entity.BalanceFlow;
import com.server.balance.entity.BalanceTransactionEntity;
import com.server.balance.entity.CategoryEntity;
import com.server.balance.model.Balance;
import com.server.balance.repostiory.BalanceTransactionRepository;
import com.server.balance.repostiory.CategoryRepository;
import com.server.balance.repostiory.CurrencyRepository;
import com.server.balance.service.BalanceService;
import com.server.balance.service.impl.BalanceServiceImpl;
import com.server.shared.entity.CurrencyEntity;
import com.server.shared.exceptions.ValidationException;
import com.server.shared.util.CommonErrorMessage;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;

@ExtendWith(MockitoExtension.class)
class BalanceServiceTest {


    private BalanceService balanceService;

    @Mock
    private CurrencyRepository currencyRepository;

    @Mock
    private CategoryRepository categoryRepository;

    @Mock
    private BalanceTransactionRepository balanceTransactionRepository;

    @Mock
    private SecurityUserDetailsService securityUserDetailsService;

    @BeforeEach
    void init() {
        balanceService =
                new BalanceServiceImpl(balanceTransactionRepository, categoryRepository, currencyRepository, securityUserDetailsService);
    }

    @Test
    void addBalance_ShouldAddBalance() {
        final Balance balance = new Balance(new BigDecimal("12.45"), "DES",
                1L, BalanceFlow.INCOME, LocalDateTime.now());
        Mockito.when(categoryRepository.getById(any()))
                .thenReturn(new CategoryEntity());
        Mockito.when(currencyRepository.getById(any()))
                .thenReturn(new CurrencyEntity());
        Mockito.when(balanceTransactionRepository.save(any()))
                .thenReturn(new BalanceTransactionEntity());

        assertDoesNotThrow(() -> balanceService.addBalance(balance));
    }

    @Test
    void deleteBalance_RecordNotExists_ShouldThrowException() {
        Mockito.when(balanceTransactionRepository.existsById(any())).thenReturn(false);

        ValidationException exception = assertThrows(ValidationException.class,
                () -> balanceService.deleteTransaction(100L));

        assertEquals(CommonErrorMessage.NOT_FOUND.name(), exception.getMessage());
    }

    @Test
    void deleteBalance_RecordExists_ShouldDeleteRecord() {
        Mockito.when(balanceTransactionRepository.existsById(any())).thenReturn(true);

        assertDoesNotThrow(() -> balanceService.deleteTransaction(100L));
    }
}
