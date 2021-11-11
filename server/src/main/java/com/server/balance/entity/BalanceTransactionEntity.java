package com.server.balance.entity;

import com.server.admin.entity.UserEntity;
import com.server.shared.exceptions.entity.BalanceFlowDictionaryEntity;
import com.server.shared.exceptions.entity.CategoryDictionaryEntity;
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

    @ManyToOne
    @JoinColumn(name = "category_id", nullable = false)
    private CategoryDictionaryEntity categoryDictionaryEntity;

    @ManyToOne
    @JoinColumn(name = "balance_flow_id", nullable = false)
    private BalanceFlowDictionaryEntity balanceFlowDictionaryEntity;

    @Column(name = "created", nullable = false)
    private DateType created;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private UserEntity userEntity;
}
