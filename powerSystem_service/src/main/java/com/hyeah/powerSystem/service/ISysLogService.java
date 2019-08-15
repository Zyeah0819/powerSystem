package com.hyeah.powerSystem.service;

import com.hyeah.powerSystem.daomain.SysLog;

import java.util.List;

public interface ISysLogService {
    List<SysLog> findAll() throws Exception;

    void save(SysLog sysLog) throws Exception;
}
