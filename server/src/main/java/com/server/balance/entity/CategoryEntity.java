package com.server.balance.entity;

import com.server.admin.entity.UserEntity;

import javax.persistence.*;

import java.sql.Date;
import java.util.Set;

import static javax.persistence.GenerationType.SEQUENCE;

@Entity(name = "categories")
public class CategoryEntity {

    @Id
    @SequenceGenerator(name = "categories_seq", sequenceName = "categories_seq", allocationSize = 1)
    @GeneratedValue(strategy = SEQUENCE, generator = "categories_seq")
    private Long id;

    @Column(name = "value", length = 255)
    private String value;

    @Column(name = "from", nullable = false)
    private Date from;

    @Column(name = "to")
    private Date to;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private UserEntity userEntity;

    @OneToMany(mappedBy = "categoryEntity")
    private Set<BalanceTransactionEntity> balanceTransactionEntitySet;
}
