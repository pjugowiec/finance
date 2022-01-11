package com.server.balance.repostiory.reports;

import com.server.balance.model.reports.CategoryReportModel;
import com.server.balance.model.reports.IncomeExpensesYearModel;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

import static com.server.balance.repostiory.reports.sql.ReportSql.CATEGORY_REPORT_SQL;
import static com.server.balance.repostiory.reports.sql.ReportSql.INCOME_EXPENSES_YEAR_REPORT;

@Component
@AllArgsConstructor
public class ReportRepository {

    private final EntityManager entityManager;

    public List<CategoryReportModel> getCategories(final Long userId) {
        final Query query = entityManager.createNativeQuery(CATEGORY_REPORT_SQL, "CategoryReportModel");
        query.setParameter("userId", userId);
        return (List<CategoryReportModel>) query.getResultList();
    }

    public List<IncomeExpensesYearModel> getIncomeExpensesYearReportData(final Long userId, final Integer year) {
        final Query query = entityManager.createNativeQuery(INCOME_EXPENSES_YEAR_REPORT, "IncomeExpensesYearModel");
        query.setParameter("userId", userId);
        query.setParameter("year", year);
        return (List<IncomeExpensesYearModel>) query.getResultList();
    }
}
