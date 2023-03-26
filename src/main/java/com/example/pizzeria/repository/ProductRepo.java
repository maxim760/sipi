package com.example.pizzeria.repository;

import com.example.pizzeria.entity.OrderEntity;
import com.example.pizzeria.entity.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface ProductRepo extends JpaRepository<ProductEntity, UUID> {
    public Optional<ProductEntity> findByNameIgnoreCase(String name);
}
