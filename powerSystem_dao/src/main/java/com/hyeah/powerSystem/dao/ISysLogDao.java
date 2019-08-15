package com.hyeah.powerSystem.dao;

import com.hyeah.powerSystem.daomain.SysLog;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import java.util.List;

public interface ISysLogDao {

    @Select("select * from sysLog")
    List<SysLog> findAll() throws Exception;

    @Select("insert into syslog(visitTime,username,ip,url,executionTime,method) values(#{visitTime},#{username},#{ip},#{url},#{executionTime},#{method})")
    void save(SysLog sysLog) throws Exception;
}
