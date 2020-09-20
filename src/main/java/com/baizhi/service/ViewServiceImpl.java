package com.baizhi.service;

import com.baizhi.dao.ViewDao;
import com.baizhi.entity.View;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @ClassName ViewServiceImpl
 * @Author wyy
 * @Date 2020/7/30 1:50
 * @Description TOOO
 */
@Service
@Transactional
public class ViewServiceImpl implements ViewService {
    @Autowired
    private ViewDao viewDao;
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<View> queryPage(String pid, Integer currentPage, Integer pageSize) {
        Integer lastPage=(currentPage-1)*pageSize;
        List<View> list = viewDao.queryPage(pid, lastPage, pageSize);
        return list;
    }
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Integer count(String pid) {
        Integer count = viewDao.count(pid);
        return count;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void add(View view) {
        viewDao.add(view);
    }
    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void update(View view) {
        viewDao.update(view);
    }
    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void delete(String vid) {
        viewDao.delete(vid);
    }
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public View queryOne(String vid) {
        View view = viewDao.queryOne(vid);
        return view;
    }
}
