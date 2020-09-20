package com.baizhi.controller;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpSession;

/**
 * @ClassName UserController
 * @Author wyy
 * @Date 2020/7/29 17:01
 * @Description TOOO
 */
@Controller
@Scope("prototype")
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(User user, Model model, String validate, HttpSession session){
        try{
            //从session作用域中获取验证码
            String code = (String) session.getAttribute("code");
            System.out.println("code==="+code);
            System.out.println("validate==="+validate);
            if(code!=null&&!code.equals(validate)){
                throw new RuntimeException("验证码错误");
            }
            User user1 = userService.login(user);
            session.setAttribute("user",user1);
            return "redirect:/province/queryPage";
        }catch(Exception e){
            e.printStackTrace();
            String message = e.getMessage();
            model.addAttribute("message",message);
            return "forward:/login.jsp";
        }
    }
    @RequestMapping("/register")
    public String register(User user, String validate, Model model, HttpSession session){
        try{
            //从session作用域中获取验证码
            String code = (String) session.getAttribute("code");
            System.out.println("code==="+code);
            System.out.println("validate==="+validate);
            if(code!=null&&!code.equals(validate)){
                throw new RuntimeException("验证码错误");
            }
            userService.register(user);
            return "redirect:/login.jsp";
        }catch(Exception e){
            e.printStackTrace();
            String message = e.getMessage();
            model.addAttribute("message",message);
            return "forward:/register.jsp";
        }
    }
    @RequestMapping("/safeOut")
    public String safeOut(SessionStatus sessionStatus){
        sessionStatus.setComplete();
        return "redirect:/login.jsp";
    }

}
