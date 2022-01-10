package com.server.balance.repostiory.reports.sql;

import lombok.NoArgsConstructor;

import static lombok.AccessLevel.PRIVATE;

@NoArgsConstructor(access = PRIVATE)
public final class ReportSql {

    public static final String CATEGORY_REPORT_SQL = "select c.value as category," +
            "sum(bt.balance / (select sum(bt2.balance) from balance_transactions bt2 where bt2.user_id = :userId) * 100) as value " +
            "from balance_transactions bt " +
            "inner join categories c on (c.id = bt.category_id) " +
            "where bt.user_id = :userId " +
            "group by c.value ";
}
