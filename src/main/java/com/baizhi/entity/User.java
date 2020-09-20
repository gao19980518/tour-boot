package com.baizhi.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * @ClassName User
 * @Author wyy
 * @Date 2020/7/29 16:23
 * @Description TOOO
 */
@Data
public class User implements Serializable {
    private String uid;
    private String username;
    private String password;
    private String email;

}
