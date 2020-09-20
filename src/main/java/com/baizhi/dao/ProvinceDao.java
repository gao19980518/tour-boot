package com.baizhi.dao;

import com.baizhi.entity.Province;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProvinceDao {
    List<Province> queryPage(@Param("lastPage")Integer lastPage, @Param("pageSize")Integer pageSize);
    Integer count();
    void add(Province province);
    void update(Province province);
    void delete(String pid);
    Province queryOne(String pid);
    List<Province> queryAll();
}
