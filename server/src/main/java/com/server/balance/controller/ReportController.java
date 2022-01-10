package com.server.balance.controller;

import com.server.balance.model.reports.CategoryReportModel;
import com.server.balance.service.ReportService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@RequestMapping(value = "/report")
@AllArgsConstructor
public class ReportController {

    private final ReportService reportService;


    @GetMapping("/category")
    public ResponseEntity<List<CategoryReportModel>> getCategoriesReport(final HttpServletRequest request) {
        final String username = request.getUserPrincipal().getName();
        return ResponseEntity.ok(reportService.getCategoryReport(username));
    }
}
