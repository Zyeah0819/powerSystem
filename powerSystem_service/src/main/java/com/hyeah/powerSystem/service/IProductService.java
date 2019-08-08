package com.hyeah.powerSystem.service;

import com.hyeah.powerSystem.daomain.Product;

import java.util.List;

public interface IProductService {
    void addProduct(Product product) throws Exception;
    //查询所有产品
     List<Product> findAll() throws Exception;
}
