package com.server.balance.service.impl;

import com.server.balance.model.Category;
import com.server.balance.repostiory.CategoryRepository;
import com.server.balance.service.CategoryService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class CategoryServiceImpl implements CategoryService {

    private final CategoryRepository categoryRepository;

    @Override
    public List<Category> getCategories(final String username) {
        return categoryRepository.getCategories(username);
    }
}
