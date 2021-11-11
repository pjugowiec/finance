package com.server.balance.repostiory;

import com.server.balance.entity.BalanceTransactionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BalanceTransactionRepository extends JpaRepository<BalanceTransactionEntity, Long> {
}
