package com.example.pizzeria.controller;

import com.example.pizzeria.DTO.CreateOrderDTO;
import com.example.pizzeria.DTO.FilterGoodsDTO;
import com.example.pizzeria.entity.GoodsEntity;
import com.example.pizzeria.entity.OrderEntity;
import com.example.pizzeria.entity.UserEntity;
import com.example.pizzeria.model.Goods;
import com.example.pizzeria.service.GoodsService;
import com.example.pizzeria.service.OrderService;
import lombok.val;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private GoodsService goodsService;
    @PostMapping
    public String createOrder(CreateOrderDTO orderDTO, @AuthenticationPrincipal UserEntity user, RedirectAttributes attrs) {
        try {
            orderService.createOrder(orderDTO, user);
            attrs.addFlashAttribute("message", "Заказ сделан");
            return "redirect:/home";
        } catch (Exception e) {
            attrs.addFlashAttribute("errorTitle", "Ошибка при создании");
            attrs.addFlashAttribute("errorMessage", e.getMessage());
            return "redirect:/error";
        }
    }

    @GetMapping
    public String getOrders(Model model, @AuthenticationPrincipal UserEntity user) {

        List<OrderEntity> orders = orderService.getOrders(user);
        Long totalCost = orderService.getSummaryCost(user);
        model.addAttribute("orders", orders);
        model.addAttribute("cost", totalCost);
        return "orders";
    }

    @GetMapping("/add")
    public String getCreateOrdersPage(Model model) {
        CreateOrderDTO orderDto = new CreateOrderDTO();
        FilterGoodsDTO filterDto = new FilterGoodsDTO();
        List<GoodsEntity> allGoods = goodsService.getAllGoods(filterDto);
        val filterDtoFromAttr = model.getAttribute("filterDto");
        val orderDtoFromAttr = model.getAttribute("orderDto");
        List<Goods> goodsFromAttr = (List<Goods>) model.getAttribute("goods");
        CreateOrderDTO orderDtoCasted = orderDtoFromAttr == null ? orderDto : (CreateOrderDTO) orderDtoFromAttr;
        val checkedGoods = goodsService.getAllByIds(orderDtoCasted.getGoodsIds());
        val currentGoods = goodsFromAttr == null ? Goods.toModel(allGoods) : goodsFromAttr;
        val resultGoods = currentGoods
                .stream()
                .filter(item -> !item.getProducts().stream().anyMatch(i -> i.getCount() <= 0))
                .collect(Collectors.toList());
        model.addAttribute("goods", resultGoods);
        model.addAttribute("checkedGoods", checkedGoods);
        model.addAttribute("filterDto", filterDtoFromAttr == null ? filterDto : filterDtoFromAttr);
        model.addAttribute("orderDto", orderDtoFromAttr == null ? orderDto : orderDtoFromAttr);
        return "addOrder";
    }
    @PostMapping("/add")
    public String updateCreateOrderPage(RedirectAttributes attrs, FilterGoodsDTO dto, CreateOrderDTO orderDto) {
        List<GoodsEntity> allGoods = goodsService.getAllGoods(dto);
        attrs.addFlashAttribute("goods", Goods.toModel(allGoods));
        attrs.addFlashAttribute("filterDto", dto);
        attrs.addFlashAttribute("orderDto", orderDto);
        return "redirect:/order/add";
    }

    @PostMapping("/{id}/confirm")
    public String confirmOrder(Model model, RedirectAttributes attrs, @PathVariable UUID id, @AuthenticationPrincipal UserEntity user) {
        try {
            orderService.confirmOrder(id);
            List<OrderEntity> orders = orderService.getOrders(user);
            Long totalCost = orderService.getSummaryCost(user);
            model.addAttribute("orders", orders);
            model.addAttribute("cost", totalCost);
            return "orders";
        } catch (Exception e) {
            attrs.addFlashAttribute("errorTitle", "Ошибка при создании");
            attrs.addFlashAttribute("errorMessage", e.getMessage());
            System.out.println("error");
            return "redirect:/error";
        }

    }

    @PostMapping("/delete/{id}")
    public String deleteOrderById(RedirectAttributes attrs, @PathVariable UUID id,  @AuthenticationPrincipal UserEntity user) {
        Boolean isDeleted = orderService.deleteOrder(id, user);
        attrs.addFlashAttribute("message", isDeleted ? "Удалено" : "Ошибка при удалении");
        return "redirect:/home";

    }
}
