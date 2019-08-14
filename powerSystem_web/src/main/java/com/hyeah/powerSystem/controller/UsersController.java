package com.hyeah.powerSystem.controller;

import com.hyeah.powerSystem.daomain.Role;
import com.hyeah.powerSystem.daomain.Users;
import com.hyeah.powerSystem.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;

@Controller
@RequestMapping("/users")
public class UsersController {

    @Autowired
    private IUserService userService;

    //添加角色
    @RequestMapping("/addRoleToUser.do")
    public String addRoleToUser(@RequestParam(value = "userId",required = true) Integer userId, @RequestParam(value = "ids",required = true) Integer[] roleIds) throws Exception {
        userService.addRoleToUser(userId,roleIds);
        return "redirect:findAll.do";
    }

    //查询可添加的角色
    @RequestMapping("/findUserByIdAndAllRole")
    public ModelAndView findUserByIdAndAllRole(Integer id) throws Exception {
        ModelAndView mv = new ModelAndView();
        //根据id查用户
        Users user = userService.findById(id);
        //根据用户id，查可以添加的角色
        List<Role> roleList = userService.findOtherRolesByUsersId(id);
        mv.addObject("user",user);
        mv.addObject("roleList",roleList);
        mv.setViewName("user-role-add");
        return mv;
    }
    //根据id查用户
    @RequestMapping("/findById.do")
    public ModelAndView findById(Integer id) throws Exception {
        ModelAndView mv = new ModelAndView();
        Users users = userService.findById(id);
        mv.addObject("users",users);
        mv.setViewName("user-show");
        return mv;
    }

    //跳转添加页面
    @RequestMapping("toAdd.do")
    private String toAdd(){
        return "user-add";
    }


    //添加用户
    @RequestMapping("/add.do")
    @PreAuthorize("authentication.principal.username=='admin'")
    public String save(Users user) throws Exception {
        userService.add(user);
        return "redirect:findAll.do";
    }


    //查询所有
    @RequestMapping("/findAll.do")
/*    @RolesAllowed("USER")*/
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Users> usersList = userService.findAll();
        mv.addObject("usersList",usersList);
        mv.setViewName("user-list");
        return mv;
    }
}
