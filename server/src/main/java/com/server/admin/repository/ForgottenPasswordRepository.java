package com.server.admin.repository;

import com.server.admin.entity.ForgottenPasswordEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ForgottenPasswordRepository extends JpaRepository<ForgottenPasswordEntity, Long> {

    @Query(value = "select MAX(e.code) from #{#entityName} e")
    String findMaxCode();

    @Query(value = "select MAX(e.validFrom) from #{#entityName} e " +
            "JOIN e.userEntity u " +
            "WHERE u.id = :userId")
    String findLastUserCode(@Param("userId") final Long userId);

    boolean existsByCode(final String code);
}
