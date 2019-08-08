package com.hyeah.powerSystem.dao;

import com.hyeah.powerSystem.daomain.Product;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface IProductDao {
    @Select("select * from product")
    List<Product> findAll() throws Exception;
}
