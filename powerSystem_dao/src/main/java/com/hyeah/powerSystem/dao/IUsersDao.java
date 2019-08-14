package com.hyeah.powerSystem.dao;

import com.hyeah.powerSystem.daomain.Product;
import com.hyeah.powerSystem.daomain.Role;
import com.hyeah.powerSystem.daomain.Users;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IUsersDao {


    //登录
    @Select("select * from users where username = #{username}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "statusStr",column = "statusStr"),
            @Result(property = "roles",column = "id",javaType = java.util.List.class,many = @Many(select = "com.hyeah.powerSystem.dao.IRoleDao.findRoleByUserId")),
            })
    Users findByUsername(String username) throws Exception;

    //查询所有
    @Select("select * from users")
    List<Users> findAll() throws Exception;


    @Select("INSERT INTO users(email,username,password,phoneNum,status) values(#{email},#{username},#{password},#{phoneNum},#{status})")
    void add(Users user) throws Exception;


    @Select("select * from users where id = #{id}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "roles",column = "id",javaType = java.util.List.class,many = @Many(select = "com.hyeah.powerSystem.dao.IRoleDao.findRoleByUserId")),
    })
    Users findById(Integer id);


    @Select("select * from role where id not in(select roleId from users_role where userId=#{id})")
    List<Role> findOtherRolesByUsersId(Integer id) throws Exception;

    //给用户添加角色
    @Select("insert into users_role(userId,roleId) values(#{userId},#{roleId})")
    void addRoleToUser(@Param("userId") Integer userId, @Param("roleId") Integer roleId) throws Exception ;
}
