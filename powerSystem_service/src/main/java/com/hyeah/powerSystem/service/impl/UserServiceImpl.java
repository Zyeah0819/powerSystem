package com.hyeah.powerSystem.service.impl;

import com.hyeah.powerSystem.dao.IUsersDao;
import com.hyeah.powerSystem.daomain.Role;
import com.hyeah.powerSystem.daomain.Users;
import com.hyeah.powerSystem.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUsersDao usersDao;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;


    //登录权限管理
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Users users = null;
        try {
              users = usersDao.findByUsername(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        User user = new User(users.getUsername(),users.getPassword(),users.getStatus()==0?false:true,true,true,true,getAuthority(users.getRoles()));
        return user;
    }
    public List<SimpleGrantedAuthority> getAuthority(List<Role> roles){
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        for (Role role:roles) {
            list.add(new SimpleGrantedAuthority("ROLE_"+role.getRoleName()));
            System.out.println(role);
        }
        return list;
    }

    @Override
    public List<Users> findAll() throws Exception {
        return usersDao.findAll();
    }

    //添加用户
    @Override
    public void add(Users user) throws Exception {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        usersDao.add(user);
    }

    @Override
    public Users findById(Integer id) throws Exception {
        return usersDao.findById(id);
    }

    @Override
    public List<Role> findOtherRolesByUsersId(Integer id) throws Exception {
        return usersDao.findOtherRolesByUsersId(id);
    }

    @Override
    public void addRoleToUser(Integer userId, Integer[] roleIds) throws Exception {
        for (Integer roleId:roleIds){

            usersDao.addRoleToUser(userId,roleId);

        }
    }
}
