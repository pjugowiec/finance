package com.server.admin.repository;

import com.server.admin.entity.ForgottenPasswordEntity;
import org.springframework.data.jpa.repository.JpaRepository;


public interface ForgottenPasswordRepository extends JpaRepository<ForgottenPasswordEntity, Long> {

    ForgottenPasswordEntity findByCode(final String code);

    boolean existsByCode(final String code);
}
