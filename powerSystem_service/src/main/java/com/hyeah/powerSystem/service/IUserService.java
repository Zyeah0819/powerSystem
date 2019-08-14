package com.hyeah.powerSystem.service;

import com.hyeah.powerSystem.daomain.Role;
import com.hyeah.powerSystem.daomain.Users;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IUserService extends UserDetailsService {
    //查询所有
    List<Users> findAll() throws Exception;

    void add(Users user) throws Exception;

    Users findById(Integer id) throws Exception;

    List<Role> findOtherRolesByUsersId(Integer id) throws Exception;

    void addRoleToUser(Integer userId, Integer[] roleIds) throws Exception;
}
