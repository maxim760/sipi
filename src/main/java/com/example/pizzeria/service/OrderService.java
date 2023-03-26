package com.example.pizzeria.service;

import com.example.pizzeria.DTO.CreateOrderDTO;
import com.example.pizzeria.Helpers.Utilities;
import com.example.pizzeria.entity.CurierEntity;
import com.example.pizzeria.entity.GoodsEntity;
import com.example.pizzeria.entity.OrderEntity;
import com.example.pizzeria.entity.UserEntity;
import com.example.pizzeria.repository.CurierRepo;
import com.example.pizzeria.repository.GoodsRepo;
import com.example.pizzeria.repository.OrderRepo;
import com.example.pizzeria.repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class OrderService {

    @Autowired
    private OrderRepo orderRepo;
    @Autowired
    private GoodsRepo goodsRepo;
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private CurierRepo curierRepo;

    @Value("${delivery.price}")
    private int deliveryPrice;
    @Value("${delivery.timeMin}")
    private Long deliveryTimeMin;

    public OrderEntity createOrder(CreateOrderDTO orderDTO, UserEntity currentUser) throws Exception {
        if(orderDTO.getGoodsIds().size() == 0) {
            throw new Exception("В заказе должен быть минимум 1 товар");
        }
        OrderEntity newOrder = new OrderEntity();
        Date currentDate = new Date();
        SimpleDateFormat formatter = Utilities.getDefaultDateFormat();
        String createDate = formatter.format(currentDate);
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        Long timestampTime = timestamp.getTime();
        Map<UUID, Integer> hm = new HashMap<>();
        for(UUID id: orderDTO.getGoodsIds()) {
            hm.put(id, hm.getOrDefault(id, 0) + 1);
        }
        int price = 0;
        for(UUID goodsItemId: orderDTO.getGoodsIds()) {
            GoodsEntity goodsItemFromDb = goodsRepo.findById(goodsItemId).orElseThrow(() -> new Exception("Товар не найден"));
            if(goodsItemFromDb.getProducts().stream().anyMatch(i -> i.getCount() < hm.getOrDefault(goodsItemId, 0))) {
                throw new Exception("Продуктов недостаточно для приготовления заказа");
            }
            newOrder.addGoods(goodsItemFromDb);
            price += goodsItemFromDb.getCurrentPrice();
        }
        newOrder.setUser(currentUser);
        newOrder.setDateCreate(createDate);

        boolean withDelivery = orderDTO.getWithDelivery() != null;
        if(withDelivery) {
            price += deliveryPrice;
            List<CurierEntity> curiers = curierRepo.findAllFree();
            if(curiers.isEmpty()) {
                throw new Exception("curier");
            }
            int count = curiers.size();
            int randomIdx = (int)Math.floor(Math.random() * count);
            CurierEntity curier = curiers.get(randomIdx);
            newOrder.setCurier(curier);
            curier.setStatus("busy");
            curier.addOrder(newOrder);
            curierRepo.save(curier);
        }
        if(price > currentUser.getCash()) {
            throw new Exception("Недостаточно денег на балансе");
        }
        newOrder.setPrice(price);
        currentUser.setCash(currentUser.getCash() - price);
        newOrder.setTimestamp(timestampTime);
        newOrder.setWithDelivery(withDelivery);
        System.out.println(newOrder.getId());
        for(GoodsEntity goodsItem: newOrder.getGoods()) {
            goodsRepo.save(goodsItem);
        }
        orderRepo.save(newOrder);
        userRepo.save(currentUser);
        return newOrder;

    }

    public List<OrderEntity> getOrders(UserEntity user) {
        if(user.getRoles().stream().anyMatch(item -> item.getAuthority().equals("ADMIN"))) {
            List<OrderEntity> list = orderRepo.findAllByOrderByTimestampDesc();
            return list;
        }
        return orderRepo.getAllOrders(user.getId());
    }
    public boolean deleteOrder(UUID id, UserEntity user) {
        try {
            Optional<OrderEntity> orderItem = orderRepo.findById(id);
            if(orderItem.isEmpty()) {
                return false;
            }
            List<GoodsEntity> goods = orderItem.get().getGoods();
            orderRepo.deleteById(id);
            List<OrderEntity> userOrders = user.getOrders();
            userOrders.removeIf((order) -> order.getId().equals(id));
            user.setOrders(userOrders);
            for(GoodsEntity goodsItem: goods) {
                goodsItem.removeOrder(id);
                goodsRepo.save(goodsItem);
            }
            return true;
        } catch(Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public Long getSummaryCost(UserEntity user) {
        if(user.getRoles().stream().anyMatch(item -> item.getAuthority().equals("ADMIN"))) {
            Long result = orderRepo.selectTotalCostAllUsers();
            return result == null ? 0L : result;
        }
        Long result = orderRepo.selectTotalCost(user.getId());
        return result == null ? 0L : result;
    }

    public void confirmOrder(UUID id) throws Exception {
        OrderEntity orderFromDb = orderRepo.findById(id).orElseThrow(() -> new Exception("Заказ не найден"));
        CurierEntity curier = orderFromDb.getCurier();
        if(curier != null) {
            curier.setStatus("free");
            curierRepo.save(curier);
        }
        orderFromDb.setDone(true);
        orderRepo.save(orderFromDb);
    }
}
