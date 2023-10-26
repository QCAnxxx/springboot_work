package cn.lemon.lib.controller;

import cn.lemon.lib.entity.Menu;
import cn.lemon.lib.service.MenuService;
import cn.lemon.lib.utils.TreeUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@Slf4j
public class HomeController {

    @Autowired
    MenuService menuService;
    @GetMapping("/")
    public String defaultPage(HttpServletRequest request, Model model) {

        if (request!=null && request.getCookies()!=null)
        {
//            for (Cookie cookie : request.getCookies()) {
//                log.info("{} {}",cookie.getName(),cookie.getValue());
//            }

            /**
             * 实现自动登录
             */
            for (Cookie cookie : request.getCookies()) {
                String id = cookie.getValue();
                log.info("{} {}",cookie.getName(),cookie.getValue());
//            long idNum=Long.parseLong(id);
                switch (cookie.getName()) {
                    case "student":
                        log.info("== HomeController：student id is {} ==", id);
                        return "studentIndex.html";

                    case "teacher":
                        log.info("== HomeController：teacher id is {} ==", id);
                        return "teacherIndex.html";

                    case "admin":
                        log.info("== HomeController：admin id is {} ==", id);
//                        log.info("== HomeController：自动登录跳转的url为： /index");

                        log.info("HomeController 渲染主页面");
                        List<Menu> menuList = menuService.getMenuList();
                        List<Menu> menuTree = TreeUtils.list2tree(menuList);
                        model.addAttribute("menuTree",menuTree);

                        return "index.html";

                    default:
//                    log.info("== HomeController noting cookie ==");
                }
            }
        }



        /**
         * 将登录页设置为主页
         */
        log.info("== HomeController：login page == ");
        return "/login/index.html";

    }
}
