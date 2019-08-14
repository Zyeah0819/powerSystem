package com.hyeah.powerSystem.controller;

import com.hyeah.powerSystem.daomain.Permission;
import com.hyeah.powerSystem.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/permission")
public class PermissionController {
    @Autowired
    private IPermissionService permissionService;

    //去添加页面
    @RequestMapping("/toAdd.do")
    public String toAdd(){
        return "permission-add";
    }
    //添加
    @RequestMapping("add.do")
    public String add(Permission permission) throws Exception {
        permissionService.add(permission);
        return "redirect:findAll.do";
    }

    //查询所有
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Permission> permissionList =permissionService.findAll();
        mv.addObject("permissionList",permissionList);
        mv.setViewName("permission-list");
        return mv;
    }
}
