package cn.lemon.lib.controller;

import cn.lemon.lib.entity.Admin;
import cn.lemon.lib.entity.Student;
import cn.lemon.lib.entity.Teacher;
import cn.lemon.lib.service.AdminService;
import cn.lemon.lib.service.MenuService;
import cn.lemon.lib.service.StudentService;
import cn.lemon.lib.service.TeacherService;
import cn.lemon.lib.utils.ControllerSimplify;
import cn.lemon.lib.utils.WithControllerSimplify;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 登录
 * */
@Controller
@Slf4j
public class LoginController {

    @Autowired
    StudentService studentService;

    @Autowired
    TeacherService teacherService;

    @Autowired
    AdminService adminService;

    @Autowired
    MenuService menuService;



    @PostMapping("/login")
    public String checkLogin(String username, String password, int type, HttpServletRequest request, HttpServletResponse response, Model model) {
        /**
         * 实现自动登录
         */

        log.info("username {}, password {}, type {}", username, password, type);

        HttpSession session = request.getSession();
        Cookie cookie = new Cookie("cookie_username", "");
        model.addAttribute("error",null);

        ControllerSimplify controllerSimplify=new ControllerSimplify(studentService,teacherService,adminService,cookie,session,username,password,model);
        WithControllerSimplify data=new WithControllerSimplify("/login/index.html",cookie);
        if (type == 0) {
            data=controllerSimplify.loginControllerCheckLoginToCheck("student");
        } else if (type == 1){
            data=controllerSimplify.loginControllerCheckLoginToCheck("teacher");
        } else if (type == 2){
            data=controllerSimplify.loginControllerCheckLoginToCheck("admin");
        }

        Cookie newCookie=data.getCookie();

        if (newCookie != null){
            log.info("传递的cookie为: {} {}",newCookie.getName(),newCookie.getValue());
            newCookie.setMaxAge(60 * 60);
            newCookie.setPath(request.getContextPath());

            // 向客户端发送cookie
            response.addCookie(newCookie);
        }


        return data.getUrl();
    }

    /**
     * 退出登录
     * */
    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        log.info("== 执行了注销操作 ==");
        // 删除session里面的用户信息
        session.removeAttribute("userInfo");

        // 删除cookie
        Cookie[] deleteCookie=request.getCookies();
        for (Cookie cookie:deleteCookie){
            if (cookie.getName().equals("student") || cookie.getName().equals("teacher") || cookie.getName().equals("admin")){
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }

        return "/login/index";
    }
}
