package com.hyeah.powerSystem.dao;

import com.hyeah.powerSystem.daomain.Product;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface IProductDao {

    //根据id查商品
    @Select("select * from product where id = #{id}")
    Product findProductById(Integer id) throws Exception;

    //添加产品
    @Insert("insert into product(id,productNum,productName,cityName,departureTime,productPrice,productDesc,productStatus) values(#{id},#{productNum},#{productName},#{cityName},#{departureTime},#{productPrice},#{productDesc},#{productStatus})")
    void addProduct(Product product);
    //查询所有的产品数据
    @Select("select * from product")
    List<Product> findAll() throws Exception;
}
