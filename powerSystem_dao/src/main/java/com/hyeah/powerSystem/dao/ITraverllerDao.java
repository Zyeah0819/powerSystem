package com.hyeah.powerSystem.dao;

import com.hyeah.powerSystem.daomain.Traveller;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ITraverllerDao {

    //根据订单id查数据
    @Select("SELECT * FROM traveller WHERE id in (SELECT travellerId FROM order_traveller WHERE ORDERID=#{ordersId})")
    List<Traveller> findByOrdersId(Integer ordersId) throws  Exception;
}
