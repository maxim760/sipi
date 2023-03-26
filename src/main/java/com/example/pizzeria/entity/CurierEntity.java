package com.example.pizzeria.entity;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "curiers")
@Getter
@Setter
public class CurierEntity {
    @Id
    @GeneratedValue
    private UUID id;
    private String name;
    private String phone;
    private String status = "free";
    @OneToMany(mappedBy = "curier")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<OrderEntity> orders = new ArrayList<>();
    public void addOrder(OrderEntity order) {
        this.orders.add(order);
    }
}
