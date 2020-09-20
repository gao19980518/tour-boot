package com.baizhi.controller;

import com.baizhi.util.SecurityCode;
import com.baizhi.util.SecurityImage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * @ClassName CodeController
 * @Author wyy
 * @Date 2020/7/29 17:01
 * @Description TOOO
 */
@Controller
@RequestMapping("/code")
public class CodeController {
    @RequestMapping("/code")
    public String code(HttpServletResponse response, HttpSession session) throws IOException {
        //获取验证码
        String securityCode = SecurityCode.getSecurityCode();
        System.out.println("验证码："+securityCode);
        //将验证码存到session作用域
        session.setAttribute("code",securityCode);
        //获取带验证码的图片
        BufferedImage image = SecurityImage.createImage(securityCode);
        //通过流  将图片响应到页面
        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(image,"png",out);
        return null;
    }

}
