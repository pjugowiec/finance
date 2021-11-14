package com.server.unit.balance.service;

import com.server.admin.service.impl.UserServiceImpl;
import com.server.balance.model.Category;
import com.server.balance.repostiory.CategoryRepository;
import com.server.balance.service.CategoryService;
import com.server.balance.service.impl.CategoryServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.neo4j.Neo4jProperties;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.Arrays;
import java.util.List;

import static com.server.helpers.RequestConfig.USERNAME_USER_1;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;

@ExtendWith(MockitoExtension.class)
class CategoryServiceTest {

    private CategoryService categoryService;

    @Mock
    private CategoryRepository categoryRepository;

    @BeforeEach
    void init() {
        categoryService = new CategoryServiceImpl(categoryRepository);
    }

    @Test
    void getCategories_ShouldReturnData() {
        Mockito.when(categoryRepository.getCategories(any()))
                .thenReturn(Arrays.asList(new Category(1L, "TEST"), new Category(2L, "TEST2")));

        List<Category> result = categoryService.getCategories(USERNAME_USER_1);

        assertEquals(2L, result.size());
    }
}
