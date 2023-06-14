package com.example.ass_sof3021_ph19850.config;

import com.example.ass_sof3021_ph19850.interceptor.AuthInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MyAppConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new AuthInterceptor())
                .addPathPatterns("/admin/**", "/user/**", "/profile")
                .excludePathPatterns("/login", "/register", "/forgot-password", "/user/trang-chu");
    }
}
