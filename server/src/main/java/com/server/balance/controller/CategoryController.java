package com.server.balance.controller;

import com.server.balance.model.Category;
import com.server.balance.service.CategoryService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Collection;

@RestController
@RequestMapping(value = "/category")
@AllArgsConstructor
public class CategoryController {

    private final CategoryService categoryService;

    @GetMapping
    public ResponseEntity<Collection<Category>> getCategories(final HttpServletRequest request) {
        final String username = request.getUserPrincipal().getName();
        return ResponseEntity.ok(categoryService.getCategories(username));
    }
}
