package com.hyeah.powerSystem.service;

import com.hyeah.powerSystem.daomain.Permission;

import java.util.List;

public interface IPermissionService {

    List<Permission> findAll() throws Exception;

    void add(Permission permission) throws Exception;
}
