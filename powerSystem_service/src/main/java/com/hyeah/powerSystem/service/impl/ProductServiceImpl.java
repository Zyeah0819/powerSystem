package com.hyeah.powerSystem.service.impl;

import com.hyeah.powerSystem.dao.IProductDao;
import com.hyeah.powerSystem.daomain.Product;
import com.hyeah.powerSystem.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class ProductServiceImpl implements IProductService {
    @Autowired
    private IProductDao productDao;

    @Override
    public void addProduct(Product product) throws Exception {
        productDao.addProduct(product);
    }

    @Override
    public List<Product> findAll() throws Exception {
        return productDao.findAll();
    }
}
