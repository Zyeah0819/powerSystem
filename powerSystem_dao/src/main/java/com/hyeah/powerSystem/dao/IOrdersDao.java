package com.hyeah.powerSystem.dao;

import com.hyeah.powerSystem.daomain.Member;
import com.hyeah.powerSystem.daomain.Orders;
import com.hyeah.powerSystem.daomain.Product;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IOrdersDao {
    //查询所有订单信息（连表）
    @Select("select * from orders")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "orderNum",column = "orderNum"),
            @Result(property = "orderTime",column = "orderTime"),
            @Result(property = "orderStatus",column = "orderStatus"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "payType",column = "payType"),
            @Result(property = "orderDesc",column = "orderDesc"),
            @Result(property = "product",column = "productId",javaType = Product.class,one = @One(select = "com.hyeah.powerSystem.dao.IProductDao.findProductById")),
           })
    List<Orders> findAll() throws Exception;
    //根据id查数据
    @Select("select * from orders where id = #{id}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "orderNum",column = "orderNum"),
            @Result(property = "orderTime",column = "orderTime"),
            @Result(property = "orderStatus",column = "orderStatus"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "payType",column = "payType"),
            @Result(property = "orderDesc",column = "orderDesc"),
            @Result(property = "product",column = "productId",javaType = Product.class,one = @One(select = "com.hyeah.powerSystem.dao.IProductDao.findProductById")),
            @Result(property = "member",column = "memberId",javaType = Member.class,one = @One(select = "com.hyeah.powerSystem.dao.IMemberDao.findById")),
            @Result(property = "travellers",column = "id",javaType = java.util.List.class,many = @Many(select = "com.hyeah.powerSystem.dao.ITraverllerDao.findByOrdersId")),
    })
    Orders findById(Integer id) throws Exception;
}
