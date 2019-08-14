package com.hyeah.powerSystem.dao;

import com.hyeah.powerSystem.daomain.Permission;
import com.hyeah.powerSystem.daomain.Role;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Service;

import java.util.List;

public interface IRoleDao {
    @Select("SELECT * from role where id in(SELECT roleId from users_role WHERE userId = #{userId})")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "roleName",column = "roleName"),
            @Result(property = "roleDesc",column = "roleDesc"),
            @Result(property = "permissions",column = "id",javaType = java.util.List.class,many = @Many(select = "com.hyeah.powerSystem.dao.IPermissionDao.findPermissionByRoleId")),
    })
    List<Role> findRoleByUserId(Integer userId);

    //查询所有角色
    @Select("select * from role")
    List<Role> findAll() throws Exception;

    //添加
    @Select("insert into role(roleName,roleDesc) values(#{roleName},#{roleDesc})")
    void add(Role role) throws Exception;

    //根据id查询数据
    @Select("select * from role where id=#{roleId}")
    Role findById(Integer roleId) throws Exception;
    //根据角色id查询角色所没有的权限
    @Select("select * from permission where id not in(select permissionId from role_permission where roleId=#{roleId})")
    List<Permission> findOthersPermissionByRoleId(Integer roleId) throws Exception;

    @Select("insert into role_permission(roleId,permissionId) values(#{roleId},#{permissionId})")
    void addPermissionToRole(@Param("roleId") Integer roleId, @Param("permissionId") Integer permissionId) throws  Exception;
}
