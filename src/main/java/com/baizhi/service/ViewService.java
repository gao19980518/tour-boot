package com.baizhi.service;

import com.baizhi.entity.View;

import java.util.List;

public interface ViewService {
    List<View> queryPage(String pid, Integer currentPage, Integer pageSize);
    Integer count(String pid);
    void add(View view);
    void update(View view);
    void delete(String vid);
    View queryOne(String vid);
}
