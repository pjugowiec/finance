package com.server.shared.repository;

import com.server.shared.entity.ParamEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ParamRepository extends JpaRepository<ParamEntity, Long> {

    @Query(value = "SELECT e.value FROM #{#entityName} e WHERE e.name = :name")
    String findValueByName(@Param("name") final String name);
}
