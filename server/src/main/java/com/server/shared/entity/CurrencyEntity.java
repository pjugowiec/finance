package com.server.shared.entity;

import com.server.balance.entity.BalanceTransactionEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.Set;

@Entity(name = "currencies")
public class CurrencyEntity {

    public static final Long POLISH_ID = 1L;

    @Id
    private Long id;

    @Column(name = "short_name", nullable = false)
    private String shortName;

    @Column(name = "name", nullable = false)
    private String name;

    @OneToMany(mappedBy = "currencyEntity")
    private Set<BalanceTransactionEntity> balanceTransactionEntitySet;
}
