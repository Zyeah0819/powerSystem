package com.hyeah.powerSystem.service.impl;

import com.hyeah.powerSystem.dao.IPermissionDao;
import com.hyeah.powerSystem.daomain.Permission;
import com.hyeah.powerSystem.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class PermissionServiceImpl implements IPermissionService {
    @Autowired
    private IPermissionDao permissionDao;

    @Override
    public List<Permission> findAll() throws Exception {
        return permissionDao.findAll();
    }

    @Override
    public void add(Permission permission) throws Exception {
        permissionDao.add(permission);
    }
}
