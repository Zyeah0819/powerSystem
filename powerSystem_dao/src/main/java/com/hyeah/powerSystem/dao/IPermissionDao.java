package com.hyeah.powerSystem.dao;

import com.hyeah.powerSystem.daomain.Permission;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import java.util.List;

public interface IPermissionDao {

    @Select("select * from permission where id in (select permissionId from role_permission where roleId=#{id})")
    Permission findPermissionByRoleId(Integer id) throws Exception;

    @Select("select * from permission")
    List<Permission> findAll() throws Exception;

    @Select("insert into permission(permissionName,url) values(#{permissionName},#{url})")
    void add(Permission permission) throws Exception;
}
