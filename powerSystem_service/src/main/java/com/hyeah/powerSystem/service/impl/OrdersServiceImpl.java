package com.hyeah.powerSystem.service.impl;

import com.github.pagehelper.PageHelper;
import com.hyeah.powerSystem.dao.IOrdersDao;
import com.hyeah.powerSystem.daomain.Orders;
import com.hyeah.powerSystem.service.IOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class OrdersServiceImpl implements IOrdersService {
    @Autowired
    private IOrdersDao ordersDao;

    @Override
    public List<Orders> findAll(int page,int size) throws Exception {
        //page是页码值，size是每页显示多少条数据
        PageHelper.startPage(page,size);
        return ordersDao.findAll();
    }
}
