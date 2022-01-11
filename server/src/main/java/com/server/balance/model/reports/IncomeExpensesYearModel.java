package com.server.balance.model.reports;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
public class IncomeExpensesYearModel {
    private Integer month;
    private Double income;
    private Double expenses;

    public IncomeExpensesYearModel(Integer month, Double income, Double expenses) {
        this.month = month;
        this.income = income;
        this.expenses = expenses;
    }
}
