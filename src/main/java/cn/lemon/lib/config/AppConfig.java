package cn.lemon.lib.config;

import cn.lemon.lib.interceptor.LoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

//@Configuration
public class AppConfig implements WebMvcConfigurer {

    @Autowired
    LoginInterceptor loginInterceptor;

    @Value("#{'${whiteList}'.split(',')}")
    public List<String> whiteList;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns(
                        "/css/**",
                        "/fonts/**",
                        "/error/**",
                        "/img/**",
                        "/js/**",
                        "/img/**",
                        "/assembly/**",
                        "/layui/**")
                .excludePathPatterns(whiteList);
    }
}
