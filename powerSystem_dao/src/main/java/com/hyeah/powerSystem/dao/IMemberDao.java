package com.hyeah.powerSystem.dao;

import com.hyeah.powerSystem.daomain.Member;
import org.apache.ibatis.annotations.Select;

public interface IMemberDao {
    //根据id查数据
    @Select("select * from member where id = #{id} ")
    Member findById(Integer id) throws Exception;
}
