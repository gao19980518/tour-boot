package com.baizhi.service;

import com.baizhi.dao.ProvinceDao;
import com.baizhi.entity.Province;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @ClassName ProvinceService
 * @Author wyy
 * @Date 2020/7/29 20:17
 * @Description TOOO
 */
@Service
@Transactional
public class ProvinceServiceImpl implements ProvinceService {
    @Autowired
    private ProvinceDao provinceDao;
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Province> queryPage(Integer currentPage, Integer pageSize) {
        Integer lastPage=(currentPage-1)*pageSize;
        List<Province> list = provinceDao.queryPage(lastPage,pageSize);
        return list;
    }
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Integer count() {
        Integer count = provinceDao.count();
        return count;
    }
    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void add(Province province) {
        provinceDao.add(province);
    }
    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void update(Province province) {
        System.out.println("this is update service province==="+province);
        provinceDao.update(province);
    }
    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void delete(String pid) {
        provinceDao.delete(pid);
    }
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Province queryOne(String pid) {
        Province province = provinceDao.queryOne(pid);
        return province;
    }
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Province> queryAll() {
        List<Province> list = provinceDao.queryAll();
        return list;
    }
}
