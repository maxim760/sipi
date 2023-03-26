package com.example.pizzeria.controller;

import com.example.pizzeria.DTO.CreateProductDTO;
import com.example.pizzeria.DTO.FilterGoodsDTO;
import com.example.pizzeria.DTO.SetDiscountDto;
import com.example.pizzeria.entity.GoodsEntity;
import com.example.pizzeria.entity.ProductEntity;
import com.example.pizzeria.model.Goods;
import com.example.pizzeria.service.GoodsService;
import com.example.pizzeria.service.ProductService;
import lombok.val;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.UUID;

@Component
@RequestMapping("/products")
public class ProductController {
    @Autowired
    private ProductService productService;

    @GetMapping
    public String getProductsPage(Model model, RedirectAttributes attrs) {
        List<ProductEntity> allProducts = productService.findAll();
        model.addAttribute("products", allProducts);
        model.addAttribute("newProductItem", new CreateProductDTO());
        return "products";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/{productId}/edit")
    public String editProductInfo(RedirectAttributes attrs, ProductEntity productItem, @PathVariable UUID productId, Model model) {
        try {
            productService.editProductInfo(productId, productItem);
            attrs.addFlashAttribute("message", "Товар изменен");
            return "redirect:/products";
        } catch (Exception e) {
            attrs.addFlashAttribute("errorTitle", "Ошибка при изменении товара");
            attrs.addFlashAttribute("errorMessage", e.getMessage());
            return "redirect:/error";
        }
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/create")
    public String createGoods(RedirectAttributes attrs, CreateProductDTO productItem, Model model) {
        try {
            productService.createProductItem(productItem);
            attrs.addFlashAttribute("message", "Товар создан");
            return "redirect:/products";
        } catch (Exception e) {
            attrs.addFlashAttribute("errorTitle", "Ошибка при создании товара");
            attrs.addFlashAttribute("errorMessage", e.getMessage());
            return "redirect:/error";
        }
    }
}
