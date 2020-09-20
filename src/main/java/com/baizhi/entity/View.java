package com.baizhi.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * @ClassName View
 * @Author wyy
 * @Date 2020/7/29 16:28
 * @Description TOOO
 */
@Data
public class View implements Serializable {
    private String vid;
    private String vname;
    private String picture;
    private String hottime;
    private Double hotprice;
    private Double normalprice;
    private String synopsis;
    private Province province;

}
