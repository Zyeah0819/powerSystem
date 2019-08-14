package com.hyeah.powerSystem.service.impl;

import com.hyeah.powerSystem.dao.IRoleDao;
import com.hyeah.powerSystem.daomain.Permission;
import com.hyeah.powerSystem.daomain.Role;
import com.hyeah.powerSystem.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RoleServiceImpl implements IRoleService {

    @Autowired
    private IRoleDao roleDao;
    @Override
    public List<Role> findAll() throws Exception {
        return roleDao.findAll();
    }

    @Override
    public void add(Role role) throws Exception {
        roleDao.add(role);
    }

    @Override
    public Role findById(Integer roleId) throws Exception {
        return roleDao.findById(roleId);
    }

    @Override
    public List<Permission> findOthersPermissionByRoleId(Integer roleId) throws Exception {
        return roleDao.findOthersPermissionByRoleId(roleId);
    }

    @Override
    public void addPermissionToRole(Integer roleId, Integer[] permissionIds) throws Exception {
        for (Integer permissionId:permissionIds){
            roleDao.addPermissionToRole(roleId,permissionId);

        }
    }
}
