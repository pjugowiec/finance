package com.server.admin.entity;

import com.server.balance.entity.BalanceTransactionEntity;
import com.server.balance.entity.CategoryEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

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
    @SequenceGenerator(name = "user_seq", sequenceName = "user_seq", allocationSize = 1)
    @GeneratedValue(strategy = SEQUENCE, generator = "user_seq")
    private Long id;

    @Column(name = "email", unique = true, nullable = false, length = 80)
    private String email;

    @Column(name = "password", nullable = false)
    private String password;

    @Enumerated(EnumType.STRING)
    private Role role;

    public static UserEntity of(final Long id, final String email, final String password, final Role role) {
        return UserEntity.builder()
                .id(id)
                .email(email)
                .password(password)
                .role(role)
                .build();
    }

    @OneToMany(mappedBy = "userEntity")
    private Set<BalanceTransactionEntity> balanceTransactionEntitySet;

    @OneToMany(mappedBy = "userEntity")
    private Set<CategoryEntity> categoryEntities;
}
