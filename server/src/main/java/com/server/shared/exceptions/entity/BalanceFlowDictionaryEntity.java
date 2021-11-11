package com.server.shared.exceptions.entity;

import com.server.balance.entity.BalanceTransactionEntity;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import java.util.Set;

@Entity
@DiscriminatorValue(value = "BalanceFlow")
public class BalanceFlowDictionaryEntity extends DictionaryEntity {

    @OneToMany(mappedBy = "balanceFlowDictionaryEntity")
    private Set<BalanceTransactionEntity> balanceTransactionEntitySet;
}
