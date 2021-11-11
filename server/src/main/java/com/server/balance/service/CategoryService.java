package com.server.balance.service;

import com.server.balance.model.Category;

import java.util.List;

public interface CategoryService {

    List<Category> getCategories(final String username);
}
