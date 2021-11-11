package com.server.admin.entity;

import com.server.balance.entity.BalanceTransactionEntity;
import lombok.*;

import javax.persistence.*;

import java.util.Set;

import static javax.persistence.GenerationType.SEQUENCE;

@Entity(name = "_adm_users")
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserEntity {

    @Id
    @SequenceGenerator(name = "USER_SEQ", sequenceName = "USER_SEQ", allocationSize = 1)
    @GeneratedValue(strategy = SEQUENCE, generator = "USER_SEQ")
    private Long id;

    @Column(name = "email", unique = true, nullable = false, length = 80)
    private String email;

    @Column(name = "password", nullable = false)
    private String password;

    @Enumerated(EnumType.STRING)
    private Role role;

    @OneToMany(mappedBy = "userEntity")
    private Set<BalanceTransactionEntity> balanceTransactionEntitySet;


}
