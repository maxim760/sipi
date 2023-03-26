package com.example.pizzeria.DTO;

import javax.persistence.Column;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class CreateGoodsDTO {
    private String goodsType = "";
    private int discount = 0;
    private int price;
    private int currentPrice;
    private String name = "";
    private String description = "";
    private String img = "";
    private List<UUID> productIds = new ArrayList<>();

}
