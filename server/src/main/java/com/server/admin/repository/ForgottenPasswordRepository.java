package com.server.admin.repository;

import com.server.admin.entity.ForgottenPasswordEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ForgottenPasswordRepository extends JpaRepository<ForgottenPasswordEntity, Long> {

    @Query(value = "select MAX(e.code) from #{#entityName} e")
    String findMaxCode();
}
