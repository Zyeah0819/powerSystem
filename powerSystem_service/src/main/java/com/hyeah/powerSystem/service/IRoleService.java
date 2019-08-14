package com.hyeah.powerSystem.service;

import com.hyeah.powerSystem.daomain.Permission;
import com.hyeah.powerSystem.daomain.Role;

import java.util.List;

public interface IRoleService {
    List<Role> findAll() throws Exception;

    void add(Role role) throws Exception;

    Role findById(Integer roleId) throws Exception;

    List<Permission> findOthersPermissionByRoleId(Integer roleId) throws Exception;

    void addPermissionToRole(Integer roleId, Integer[] permissionIds) throws Exception;
}
