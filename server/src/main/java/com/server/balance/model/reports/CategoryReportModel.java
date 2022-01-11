package com.server.balance.model.reports;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public final class CategoryReportModel {
    private String category;
    private Double value;

    public CategoryReportModel(String category, Double value) {
        this.category = category;
        this.value = value;
    }
}
