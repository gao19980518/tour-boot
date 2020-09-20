package com.baizhi.service;

import com.baizhi.entity.Province;

import java.util.List;

public interface ProvinceService {
    List<Province> queryPage(Integer currentPage, Integer pageSize);
    Integer count();
    void add(Province province);
    void update(Province province);
    void delete(String pid);
    Province queryOne(String pid);
    List<Province> queryAll();
}
