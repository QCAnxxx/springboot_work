package cn.lemon.lib.controller;

import cn.lemon.lib.entity.Admin;
import cn.lemon.lib.entity.Student;
import cn.lemon.lib.entity.Teacher;
import cn.lemon.lib.service.AdminService;
import cn.lemon.lib.service.MenuService;
import cn.lemon.lib.service.StudentService;
import cn.lemon.lib.service.TeacherService;
import cn.lemon.lib.utils.ControllerSimplify;
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


    /**
     * 登录验证
     * */
    @PostMapping("/login")
    public String checkLogin(String username, String password, int type, HttpServletRequest request, HttpServletResponse response, Model model) {

        log.info("username {}, password {}, type {}", username, password, type);

        HttpSession session = request.getSession();
        Cookie cookie = new Cookie("cookie_username", "");
        model.addAttribute("error",null);

        ControllerSimplify controllerSimplify=new ControllerSimplify(studentService,teacherService,adminService,cookie,session,username,password,model);
        String returnPath="/login/index.html";
        if (type == 0) {
            returnPath=controllerSimplify.loginControllerCheckLoginToCheck("student");
        } else if (type == 1){
            returnPath=controllerSimplify.loginControllerCheckLoginToCheck("teacher");
        } else if (type == 2){
            returnPath=controllerSimplify.loginControllerCheckLoginToCheck("admin");
        }
        cookie.setMaxAge(60 * 60);

        cookie.setPath(request.getContextPath());

        // 向客户端发送cookie
        response.addCookie(cookie);

        return returnPath;
    }

    /**
     * 退出登录
     * */
    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        // 删除session里面的用户信息
        session.removeAttribute("userInfo");
        // 保存cookie，实现自动登录
        Cookie cookie_username = new Cookie("cookie_username", "");
        // 设置cookie的持久化时间，0
        cookie_username.setMaxAge(0);
        // 设置为当前项目下都携带这个cookie
        cookie_username.setPath(request.getContextPath());
        // 向客户端发送cookie
        response.addCookie(cookie_username);
        return "/login/index";
    }
}
