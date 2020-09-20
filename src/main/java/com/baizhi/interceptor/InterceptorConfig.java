package com.baizhi.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @ClassName InterceptorConfig
 * @Author wyy
 * @Date 2020/7/31 21:30
 * @Description TOOO
 */
@Component
public class InterceptorConfig implements WebMvcConfigurer {

    public  void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new MyInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/user/login")
                .excludePathPatterns("/code/code")
                .excludePathPatterns("/user/register")
                .excludePathPatterns("/","/css/**","/js/**","/img/**");
    }

}
