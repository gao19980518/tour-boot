package com.baizhi.interceptor;
import com.baizhi.entity.User;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @ClassName MyInterceptor
 * @Author wyy
 * @Date 2020/7/29 16:13
 * @Description TOOO
 */
public class MyInterceptor implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        System.out.println("this is interceptor all page");
        HttpSession session = request.getSession();
        User user =(User)session.getAttribute("user");
        if(user==null){
            //用户没有登录  重定向到登录页面
            response.sendRedirect(request.getContextPath()+"/login.jsp");
            return false;
        }else{
            //登录过  放行
            return true;
        }
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           @Nullable ModelAndView modelAndView) throws Exception {

    }

    public  void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
                                 @Nullable Exception ex) throws Exception {

    }

}
