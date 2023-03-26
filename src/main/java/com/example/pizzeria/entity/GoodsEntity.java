package com.example.pizzeria.entity;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "goods")
@Getter
@Setter
@ToString
public class GoodsEntity {
    @Id
    @GeneratedValue
    private UUID id;
    @Column(name = "good_type")
    private String goodsType = "";
    private int discount = 0;
    private int price;
    @Column(name = "current_price")
    private int currentPrice;
    private String name = "";
    private String description = "";
    private String img = "";

    @ManyToMany(mappedBy = "goods", fetch = FetchType.EAGER)
    @NotFound(action = NotFoundAction.IGNORE)
    private Set<OrderEntity> orders = new HashSet<>();

    @JoinTable(
            name = "product_goods",
            joinColumns = @JoinColumn(name = "goods_id"),
            inverseJoinColumns = @JoinColumn(name = "product_id")
    )
    @ManyToMany(fetch = FetchType.EAGER)
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<ProductEntity> products = new ArrayList<>();

    public void addOrder(OrderEntity order) {
        this.orders.add(order);
    }
    public void removeOrder(UUID id) {
        this.orders.removeIf((item) -> item.getId().equals(id));
    }
}
