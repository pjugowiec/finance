package com.server.balance.entity;

import com.server.admin.entity.UserEntity;
import com.server.shared.entity.CurrencyEntity;
import org.hibernate.type.DateType;

import javax.persistence.*;

import static javax.persistence.GenerationType.SEQUENCE;

@Entity(name = "balance_transactions")
public class BalanceTransactionEntity {

    @Id
    @SequenceGenerator(name = "balance_transaction_seq", sequenceName = "balance_transaction_seq", allocationSize = 1)
    @GeneratedValue(strategy = SEQUENCE, generator = "balance_transaction_seq")
    private Long id;

    @Column(length = 500)
    private String description;

    @Column
    private Long balance;

    @Enumerated(EnumType.STRING)
    @Column(name = "balance_flow")
    private BalanceFlow balanceFlow;

    @Column(name = "created", nullable = false)
    private DateType created;

    @ManyToOne
    @JoinColumn(name = "category_id", nullable = false)
    private CategoryEntity categoryEntity;

    @ManyToOne
    @JoinColumn(name = "currency_id", nullable = false)
    private CurrencyEntity currencyEntity;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private UserEntity userEntity;
}
