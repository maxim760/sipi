package com.example.pizzeria.DTO;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CreateProductDTO {
    private String name;
    private int count = 0;
}
