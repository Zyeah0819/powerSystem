package com.hyeah.powerSystem.service;

import com.hyeah.powerSystem.daomain.Product;

import java.util.List;

public interface IProductService {
    public List<Product> findAll() throws Exception;
}
