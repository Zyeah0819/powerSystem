package com.hyeah.powerSystem.service;

import com.hyeah.powerSystem.daomain.Orders;
import org.springframework.core.annotation.Order;

import java.util.List;

public interface IOrdersService {

    //查询所有订单
    List<Orders> findAll(int page,int size) throws Exception;
}
