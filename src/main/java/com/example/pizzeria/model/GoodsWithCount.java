package com.example.pizzeria.model;

import com.example.pizzeria.entity.GoodsEntity;
import com.example.pizzeria.entity.ProductEntity;
import lombok.Getter;
import lombok.Setter;

import java.util.*;

@Getter
@Setter
public class GoodsWithCount {
    private UUID id;
    private String goodsType;
    private int discount;
    private int count;
    private int price;
    private int currentPrice;
    private String name;
    private String description;
    private String img;
    private List<ProductEntity> products;

    public GoodsWithCount () {}

    public static GoodsWithCount toModel(GoodsEntity goodsEntity, int count) {
        GoodsWithCount goods = new GoodsWithCount();
        goods.setGoodsType(goodsEntity.getGoodsType());
        goods.setDescription(goodsEntity.getDescription());
        goods.setDiscount(goodsEntity.getDiscount());
        goods.setPrice(goodsEntity.getPrice());
        goods.setCurrentPrice(goodsEntity.getCurrentPrice());
        goods.setImg(goodsEntity.getImg());
        goods.setName(goodsEntity.getName());
        goods.setId(goodsEntity.getId());
        goods.setProducts(goodsEntity.getProducts());
        goods.setCount(count);
        return goods;
    }
    public static List<GoodsWithCount> toModel(List<GoodsEntity> goodsEntities) {
        HashMap<UUID, Integer> countMap = new HashMap<>();
        HashMap<UUID, GoodsEntity> itemsMap = new HashMap<>();
        for (GoodsEntity item: goodsEntities) {
            countMap.put(item.getId(), countMap.getOrDefault(item.getId(), 0) + 1);
            itemsMap.put(item.getId(), item);
        }
        List<GoodsWithCount> list = new ArrayList<>();
        for(Map.Entry<UUID, Integer> entry: countMap.entrySet()) {
            GoodsEntity item = itemsMap.get(entry.getKey());
            list.add(toModel(item, entry.getValue()));
        }
        return list;
    }
}
