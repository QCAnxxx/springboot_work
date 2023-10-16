package cn.lemon.lib.utils;

import cn.lemon.lib.entity.Admin;
import cn.lemon.lib.entity.Student;
import cn.lemon.lib.entity.Teacher;
import cn.lemon.lib.service.AdminService;
import cn.lemon.lib.service.StudentService;
import cn.lemon.lib.service.TeacherService;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
public class ControllerSimplify {

    StudentService studentService;

    TeacherService teacherService;

    AdminService adminService;

    Cookie cookie;

    HttpSession session;

    String username;

    String password;

    Model model;


    public ControllerSimplify(StudentService studentService, TeacherService teacherService, AdminService adminService,Cookie cookie,HttpSession session, String username, String password, Model model){
        this.studentService=studentService;
        this.teacherService=teacherService;
        this.adminService=adminService;
        this.cookie=cookie;
        this.session=session;
        this.username=username;
        this.password=password;
        this.model=model;
    }
    public String loginControllerCheckLoginToCheck(String server)
    {
        switch (server) {
            case "student":
                Student student = studentService.check(username, password);
                if (student == null)
                {
                    model.addAttribute("error","账号密码错误");
                    return "/login/index.html";
                }
                cookie = new Cookie("cookie_username", String.valueOf(student.getId()));
                session.setAttribute("userInfo",student.getId());
                return "studentIndex.html";

            case "teacher":
                Teacher teacher=teacherService.check(username,password);
                if (teacher == null)
                {
                    model.addAttribute("error","账号密码错误");
                    return "/login/index.html";
                }
                cookie = new Cookie("cookie_username", String.valueOf(teacher.getId()));
                session.setAttribute("userInfo",teacher.getId());
                return "teacherIndex.html";


            case "admin":
                Admin admin=adminService.check(username,password);
                if (admin == null)
                {
                    model.addAttribute("error","账号密码错误");
                    return "/login/index.html";
                }
                cookie = new Cookie("cookie_username", String.valueOf(admin.getId()));
                session.setAttribute("userInfo",admin.getId());
                return "index.html";

            default:
                log.error("== loginControllerCheckLoginToCheck WRONG ==");
                return "/login/index.html";
        }

    }
}
