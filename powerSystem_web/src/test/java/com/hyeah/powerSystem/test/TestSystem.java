package com.hyeah.powerSystem.test;

import com.hyeah.powerSystem.dao.IMemberDao;
import com.hyeah.powerSystem.dao.ITraverllerDao;
import com.hyeah.powerSystem.daomain.*;
import com.hyeah.powerSystem.service.IOrdersService;
import com.hyeah.powerSystem.service.ISysLogService;
import com.hyeah.powerSystem.service.IUserService;
import org.aspectj.lang.annotation.Aspect;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( locations = "classpath:applicationContext.xml")
public class TestSystem {
    @Autowired
    private IOrdersService ordersService;
    @Autowired
    private IMemberDao memberDao;
    @Autowired
    private ITraverllerDao traverllerDao;
    @Autowired
    private IUserService userService;
    @Autowired
    private ISysLogService sysLogServices;
    @Test
    public void test() throws Exception {

/*        Orders orders = ordersService.findByid(1);
        Member member = memberDao.findById(1);
        List<Traveller> travellerList = traverllerDao.findByOrdersId(1);
        List<Users> usersList = userService.findAll();
        System.out.println("数据："+usersList);*/
        List<SysLog> logList=sysLogServices.findAll();
        System.out.println(logList);
    }
}
