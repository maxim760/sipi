package com.example.pizzeria.service;
import com.example.pizzeria.DTO.CreateCurierDTO;
import com.example.pizzeria.entity.CurierEntity;
import com.example.pizzeria.repository.CurierRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class CurierService {

    @Autowired
    private CurierRepo curierRepo;

    public List<CurierEntity> findAll() {
        return curierRepo.findAll();
    }

    public CurierEntity createCurierItem(CreateCurierDTO curierDTO) throws Exception {
        CurierEntity curierItem = new CurierEntity();
        curierItem.setName(curierDTO.getName());
        curierItem.setPhone(curierDTO.getPhone());
        curierItem.setOrders(new ArrayList<>());
        curierRepo.save(curierItem);
        return curierItem;
    }

    public CurierEntity editCurierInfo(UUID curierId, CurierEntity curierItem) throws Exception {
        CurierEntity curierItemFromDb = curierRepo.findById(curierId).orElseThrow(() -> new Exception("не найден"));
        curierItemFromDb.setName(curierItem.getName());
        curierItemFromDb.setPhone(curierItem.getPhone());
        curierItemFromDb.setStatus(curierItem.getStatus());
        curierRepo.save(curierItemFromDb);
        return curierItemFromDb;
    }

    public void delete(UUID curierId) throws Exception {
        CurierEntity curier = curierRepo.findById(curierId).orElseThrow(() -> new Exception("Не найдено"));
        if(curier.getStatus() != "free") {
            throw new Exception("Курьер несет заказ, его нельзя удалить");
        }
        curierRepo.deleteById(curierId);
    }
}