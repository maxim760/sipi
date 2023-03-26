package com.example.pizzeria.service;

import com.example.pizzeria.DTO.CreateProductDTO;
import com.example.pizzeria.entity.ProductEntity;
import com.example.pizzeria.repository.ProductRepo;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {

    @Autowired
    private ProductRepo productRepo;

    public List<ProductEntity> findAll() {
        return productRepo.findAll();
    }

    public ProductEntity createProductItem(CreateProductDTO productDTO) throws Exception {
        if(productRepo.findByNameIgnoreCase(productDTO.getName()).isPresent()) {
            throw new Exception("Товар с таким назвнием уже существует");
        }
        if(productDTO.getCount() < 0) {
            throw new Exception("Количество товара не может быть отрицательным");
        }
        ProductEntity productItem = new ProductEntity();
        productItem.setName(productDTO.getName());
        productItem.setCount(productDTO.getCount());
        productItem.setGoods(new ArrayList<>());
        productRepo.save(productItem);
        return productItem;
    }

    public ProductEntity editProductInfo(UUID productId, ProductEntity productItem) throws Exception {
        ProductEntity productItemFromDb = productRepo.findById(productId).orElseThrow(() -> new Exception("Товар не найден"));
        if(productItem.getCount() < 0) {
            throw new Exception("Количество товара не может быть отрицательным");
        }
        productItemFromDb.setName(productItem.getName());
        productItemFromDb.setCount(productItem.getCount());
        productRepo.save(productItemFromDb);
        return productItemFromDb;
    }
}
