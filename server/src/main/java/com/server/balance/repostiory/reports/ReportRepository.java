package com.server.balance.repostiory.reports;

import com.server.balance.model.reports.CategoryReportModel;
import com.server.balance.repostiory.CategoryRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

import static com.server.balance.repostiory.reports.sql.ReportSql.CATEGORY_REPORT_SQL;

@Component
@AllArgsConstructor
public class ReportRepository {

    private final EntityManager entityManager;

    public List<CategoryReportModel> getCategories(final Long userId) {
        final Query query = entityManager.createNativeQuery(CATEGORY_REPORT_SQL, "CategoryReportModel");
        query.setParameter("userId", userId);
        return (List<CategoryReportModel>) query.getResultList();
    }
}
