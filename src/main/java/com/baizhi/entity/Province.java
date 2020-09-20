package com.baizhi.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * @ClassName Province
 * @Author wyy
 * @Date 2020/7/29 16:28
 * @Description TOOO
 */
@Data
public class Province implements Serializable {
    private String pid;
    private String pname;
    private String ptag;
    private Integer count;
//    private List<View> views;

}
