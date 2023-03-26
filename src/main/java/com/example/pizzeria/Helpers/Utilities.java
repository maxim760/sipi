package com.example.pizzeria.Helpers;

import com.example.pizzeria.entity.*;
import com.example.pizzeria.model.Goods;
import com.example.pizzeria.model.GoodsWithCount;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Component
public class Utilities {
    static public int ceil(int a) {
        return (int)Math.ceil((double)a);
    }

    static public SimpleDateFormat getDefaultDateFormat() {
        SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy HH:mm:ss", new Locale("ru"));
        formatter.setTimeZone(TimeZone.getTimeZone("Europe/Moscow"));
        return formatter;
    }

    static public List<CertificateEntity> sortCertificates(List<CertificateEntity> list) {
        SimpleDateFormat simpleDateFormat = getDefaultDateFormat();
        Collections.sort(list, (CertificateEntity o1, CertificateEntity o2) -> {
            try {
                return simpleDateFormat.parse(o2.getDateCreate()).compareTo(simpleDateFormat.parse(o1.getDateCreate()));
            } catch (ParseException e) {
                return 0;
            }
        });
        return list;
    }

    static public List<OrderEntity> sortOrder(List<OrderEntity> list) {
        Collections.sort(list, (OrderEntity o1, OrderEntity o2) -> {
            return o1.getTimestamp().compareTo(o2.getTimestamp());
        });
        return list;
    }

    static public boolean hasProducts(Goods item) {
        return !item.getProducts().stream().anyMatch(i -> i.getCount() <= 0);
    }
    static public List<GoodsWithCount> getGoodsWithCount(List<GoodsEntity> list) {
        return GoodsWithCount.toModel(list);
    }

    static public boolean hasEqualProducts(List<ProductEntity> list, ProductEntity item) {
        return list.stream().filter(listItem -> listItem.getId().equals(item.getId())).count() > 0;
    }
    static public String getLastOrder(CurierEntity curier) {
        List<OrderEntity> orders = sortOrder(curier.getOrders());
        if(orders.size() == 0) {
            return "Не найдено";
        }
        OrderEntity order = orders.get(orders.size() - 1);
        return order.getId().toString();
    }
}
