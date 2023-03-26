package com.example.pizzeria.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "products")
@Getter
@Setter
public class ProductEntity {
    @Id
    @GeneratedValue
    private UUID id;
    private String name;
    private int count = 0;
    @ManyToMany(mappedBy = "products", fetch = FetchType.EAGER)
    private List<GoodsEntity> goods = new ArrayList<>();
    public void addGoods(GoodsEntity goods) {
        this.goods.add(goods);
    }

}
