package com.server.balance.service;

import com.server.balance.model.reports.CategoryReportModel;

import java.util.List;

public interface ReportService {


    List<CategoryReportModel> getCategoryReport(final String username);
}
