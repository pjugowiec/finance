package com.server.admin.repository;

import com.server.admin.entity.ForgottenPasswordEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.List;


public interface ForgottenPasswordRepository extends JpaRepository<ForgottenPasswordEntity, Long> {

    ForgottenPasswordEntity findByCode(final String code);

    boolean existsByCode(final String code);


    @Query(value = "select e from #{#entityName} e " +
            "WHERE e.validFrom < :date and validTo is NULL")
    List<ForgottenPasswordEntity> findAllOlderThan15Minutes(@Param("date") final LocalDateTime date);
}
