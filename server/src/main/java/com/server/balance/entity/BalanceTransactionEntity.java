package com.server.balance.entity;

import com.server.admin.entity.UserEntity;
import com.server.balance.model.reports.CategoryReportModel;
import com.server.balance.model.reports.IncomeExpensesYearModel;
import com.server.shared.entity.CurrencyEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;

import static javax.persistence.GenerationType.SEQUENCE;

@Entity(name = "balance_transactions")
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@SqlResultSetMapping(name = "CategoryReportModel", classes = {
        @ConstructorResult(targetClass = CategoryReportModel.class,
                columns = {@ColumnResult(name = "category", type = String.class), @ColumnResult(name = "value", type = Double.class)})
})

@SqlResultSetMapping(name = "IncomeExpensesYearModel", classes = {
        @ConstructorResult(targetClass = IncomeExpensesYearModel.class,
                columns = {@ColumnResult(name = "month", type = Integer.class), @ColumnResult(name = "income", type = Double.class),
                        @ColumnResult(name = "expenses", type = Double.class)})
})
public class BalanceTransactionEntity {

    @Id
    @SequenceGenerator(name = "balance_transaction_seq", sequenceName = "balance_transaction_seq", allocationSize = 1)
    @GeneratedValue(strategy = SEQUENCE, generator = "balance_transaction_seq")
    private Long id;

    @Column(length = 500)
    private String description;

    @Column
    private BigDecimal balance;

    @Enumerated(EnumType.STRING)
    @Column(name = "balance_flow")
    private BalanceFlow balanceFlow;

    @Column(name = "created", nullable = false, updatable = false)
    private LocalDateTime created;

    @Column(name = "transaction_date")
    private LocalDateTime transactionDate;

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
