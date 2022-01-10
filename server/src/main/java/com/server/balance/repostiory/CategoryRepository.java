package com.server.balance.repostiory;

import com.server.balance.entity.CategoryEntity;
import com.server.balance.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<CategoryEntity, Long> {

    @Query(value = "SELECT new com.server.balance.model.Category(e.id, e.value) " +
            "FROM #{#entityName} e " +
            "LEFT JOIN e.userEntity u " +
            "WHERE e.to IS NULL " +
            "AND (u.email = :username OR e.userEntity IS NULL)")
    List<Category> getCategories(@Param("username") final String username);
}
