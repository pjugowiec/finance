package com.server.balance.service;

import com.server.balance.model.reports.CategoryReportModel;
import com.server.balance.model.reports.IncomeExpensesYearModel;

import java.util.List;

public interface ReportService {


    List<CategoryReportModel> getCategoryReportData(final String username);


    List<IncomeExpensesYearModel> getIncomeExpensesReportData(final String username, final Integer year);
}
