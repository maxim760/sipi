package com.example.pizzeria.repository;

import com.example.pizzeria.entity.CurierEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;


public interface CurierRepo extends JpaRepository<CurierEntity, UUID> {
    public Optional<CurierEntity> findByNameIgnoreCase(String name);
    public List<CurierEntity> findAllByStatusEquals(String status);
    default List<CurierEntity> findAllFree() {
        return findAllByStatusEquals("free");
    }

}
