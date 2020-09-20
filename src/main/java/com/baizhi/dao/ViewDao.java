package com.baizhi.dao;
import com.baizhi.entity.View;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ViewDao {
    List<View> queryPage(@Param(("pid")) String pid, @Param("lastPage") Integer lastPage, @Param("pageSize") Integer pageSize);
    Integer count(@Param(("pid")) String pid);
    void add(View view);
    void update(View view);
    void delete(String vid);
    View queryOne(String vid);
}
