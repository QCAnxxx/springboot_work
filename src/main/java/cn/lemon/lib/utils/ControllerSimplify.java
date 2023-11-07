package cn.lemon.lib.utils;

import cn.lemon.lib.entity.Admin;
import cn.lemon.lib.entity.Menu;
import cn.lemon.lib.entity.Student;
import cn.lemon.lib.entity.Teacher;
import cn.lemon.lib.service.AdminService;
import cn.lemon.lib.service.MenuService;
import cn.lemon.lib.service.StudentService;
import cn.lemon.lib.service.TeacherService;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
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

//    @Autowired
//    MenuService menuService;


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

    /**
     * 该方法目的为 LoginController checkLogin 进行简化。
     * WithControllerSimplify的产生是为了模拟实现多参数传递
     * @param server
     * @return  WithControllerSimplify
     */
    public WithControllerSimplify loginControllerCheckLoginToCheck(String server)
    {
        switch (server) {
            case "student":
                Student student = studentService.check(username, password);
                if (student == null)
                {
                    model.addAttribute("error","账号密码错误");
                    return new WithControllerSimplify("/login/index.html",null);
                }
                cookie = new Cookie("student", String.valueOf(student.getId()));
                session.setAttribute("userInfo",student.getId());
                session.setAttribute("type",1);
                model.addAttribute("name",username);
                return new WithControllerSimplify("studentIndex.html",cookie);

            case "teacher":
                Teacher teacher=teacherService.check(username,password);
                if (teacher == null)
                {
                    model.addAttribute("error","账号密码错误");
                    return new WithControllerSimplify("/login/index.html",null);
                }
                cookie = new Cookie("teacher", String.valueOf(teacher.getId()));
                session.setAttribute("userInfo",teacher.getId());
                session.setAttribute("type",2);
                model.addAttribute("name",username);
                return new WithControllerSimplify("teacherIndex.html",cookie);


            case "admin":
                Admin admin=adminService.check(username,password);
                if (admin == null)
                {
                    model.addAttribute("error","账号密码错误");
                    return new WithControllerSimplify("/login/index.html",null);
                }
                cookie = new Cookie("admin", String.valueOf(admin.getId()));

                session.setAttribute("userInfo",admin.getId());
                session.setAttribute("type",0);
                model.addAttribute("name","admin");
//                return new WithControllerSimplify("index.html",cookie);

//                indexDraw();
//                log.info("ControllerSimplify 渲染主页面");
//                List<Menu> menuList = menuService.getMenuList();
//                List<Menu> menuTree = TreeUtils.list2tree(menuList);
//                model.addAttribute("menuTree",menuTree);

                return new WithControllerSimplify("index.html",cookie);

            default:
                log.error("== loginControllerCheckLoginToCheck WRONG ==");
                return new WithControllerSimplify("/login/index.html",null);
        }

    }


//    public void indexDraw(){
//        log.info("ControllerSimplify 渲染主页面");
//        List<Menu> menuList = menuService.getMenuList();
//        List<Menu> menuTree = TreeUtils.list2tree(menuList);
//        model.addAttribute("menuTree",menuTree);
//    }
}
