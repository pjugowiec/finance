package com.server.balance.repostiory;

import com.server.balance.entity.BalanceTransactionEntity;
import com.server.balance.model.BalanceSummary;
import com.server.balance.model.Transaction;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface BalanceTransactionRepository extends JpaRepository<BalanceTransactionEntity, Long> {

    @Query(value = "SELECT new com.server.balance.model.BalanceSummary(" +
            "SUM(e.balance) as balance, " +
            "SUM(case when e.balanceFlow = 'INCOME' then e.balance else 0 end) as income, " +
            "SUM(case when e.balanceFlow = 'EXPENSES' then e.balance else 0 end) as EXPENSES) " +
            "from #{#entityName} e " +
            "JOIN e.userEntity u " +
            "WHERE u.email = :username")
    BalanceSummary getSummary(@Param("username") final String username);


    @Query(value = "SELECT new com.server.balance.model.Transaction(" +
            "e.id, " +
            "e.balanceFlow, " +
            "e.description, " +
            "c.value, " +
            "e.balance, " +
            "e.transactionDate) " +
            "FROM #{#entityName} e " +
            "JOIN e.categoryEntity c " +
            "JOIN e.userEntity u " +
            "WHERE (e.transactionDate BETWEEN :from AND :to) " +
            "AND (c.id IN :categoryIds OR (:categoryIds) IS NULL) " +
            "AND (e.balance BETWEEN :minAmount AND :maxAmount) " +
            "AND u.email = :username")
    List<Transaction> getTranslations(@Param("from")final LocalDateTime from,
                                      @Param("to")final LocalDateTime to,
                                      @Param("username")final String username,
                                      @Param("categoryIds") final List<Long> categoryIds,
                                      @Param("minAmount") final BigDecimal minAmount,
                                      @Param("maxAmount") final BigDecimal maxAmount,
                                      Pageable page);
}
