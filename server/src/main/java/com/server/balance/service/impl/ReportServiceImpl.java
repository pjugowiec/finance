package com.server.balance.service.impl;

import com.server.admin.repository.UserRepository;
import com.server.balance.model.reports.CategoryReportModel;
import com.server.balance.repostiory.reports.ReportRepository;
import com.server.balance.service.ReportService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@AllArgsConstructor
public class ReportServiceImpl implements ReportService {

    private final ReportRepository reportRepository;
    private final UserRepository userRepository;


    @Override
    @Transactional
    public List<CategoryReportModel> getCategoryReport(final String username) {
        final Long userId = userRepository.findIdByEmail(username);
        return reportRepository.getCategories(userId);
    }
}
