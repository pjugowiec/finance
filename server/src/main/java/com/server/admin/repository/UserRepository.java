package com.server.admin.repository;

import com.server.admin.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Long> {

    Optional<UserEntity> findByEmail(final String email);

    @Query(value = "SELECT e.id FROM #{#entityName} e WHERE e.email = :email")
    Long findIdByEmail(final @Param("email") String email);
}
