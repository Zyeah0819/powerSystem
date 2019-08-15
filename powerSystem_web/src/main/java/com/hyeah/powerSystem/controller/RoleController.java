package com.hyeah.powerSystem.controller;

import com.hyeah.powerSystem.daomain.Permission;
import com.hyeah.powerSystem.daomain.Role;
import com.hyeah.powerSystem.service.IRoleService;
import com.hyeah.powerSystem.service.IUserService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    @RequestMapping("/addPermissionToRole.do")
    public String addPermissionToRole(@RequestParam(value = "roleId",required = true) Integer roleId,
                                      @RequestParam(value = "ids",required = true) Integer[] permissionIds) throws Exception {
        roleService.addPermissionToRole(roleId,permissionIds);
        return "redirect:findAll.do";
    }

    @RequestMapping("/findRoleByIdAndAllPermission.do")
    public ModelAndView findRoleByIdAndAllPermission(@RequestParam(value = "id",required = true) Integer roleId) throws Exception {
        ModelAndView mv = new ModelAndView();
        //根据id查角色
        Role role = roleService.findById(roleId);
        //根据用户id查角色没有的权限
        List<Permission> othersPermission = roleService.findOthersPermissionByRoleId(roleId);
        mv.addObject("role",role);
        mv.addObject("othersPermission",othersPermission);
        mv.setViewName("role-permission-add");
        return mv;

    }
    //跳转添加页面
    @RequestMapping("toAdd.do")
    public String toAdd(){
        return "role-add";
    }

    //添加角色
    @RequestMapping("/add.do")
    public String add(Role role) throws Exception {
        roleService.add(role);
        return "redirect:findAll.do";
    }

    //查询所有角色
    @RequestMapping("/findAll.do")
    @Secured("ROLE_ADMIN")
    public ModelAndView findAll() throws Exception {

        ModelAndView mv = new ModelAndView();
        List<Role> roleList = roleService.findAll();
        mv.addObject("roleList",roleList);
        mv.setViewName("role-list");
        return mv;
    }
}
