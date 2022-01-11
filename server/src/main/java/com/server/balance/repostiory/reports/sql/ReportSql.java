package com.server.balance.repostiory.reports.sql;

import lombok.NoArgsConstructor;

import static lombok.AccessLevel.PRIVATE;

@NoArgsConstructor(access = PRIVATE)
public final class ReportSql {

    public static final String CATEGORY_REPORT_SQL = "select c.value as category," +
            "sum(bt.balance / (select sum(bt2.balance) from balance_transactions bt2 where bt2.user_id = :userId and bt2.balance_flow = 'EXPENSES') * 100) as value " +
            "from balance_transactions bt " +
            "inner join categories c on (c.id = bt.category_id) " +
            "where bt.user_id = :userId and bt.balance_flow = 'EXPENSES'" +
            "group by c.value ";

    public static final String INCOME_EXPENSES_YEAR_REPORT = "select date_part('month', bt.transaction_date) as month, " +
            "case " +
            "   when bt.balance_flow = 'INCOME' then sum(bt.balance) " +
            "   else null " +
            "end as income, " +
            "case " +
            "   when bt.balance_flow = 'EXPENSES' then sum(bt.balance) " +
            "   else null " +
            "end as expenses " +
            "from balance_transactions bt " +
            "where bt.user_id = :userId and date_part('year', bt.transaction_date) = :year " +
            "group by date_part('month', bt.transaction_date), bt.balance_flow;";
}
