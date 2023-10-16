package cn.lemon.lib.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

@Controller
@Slf4j
public class HomeController {
    @GetMapping("/")
    public String defaultPage(HttpServletRequest request) {

        for (Cookie cookie : request.getCookies()) {
            log.info("{} {}",cookie.getName(),cookie.getValue());
        }

        /**
         * 实现自动登录
         */
        for (Cookie cookie : request.getCookies()) {
            String id = cookie.getValue();
            log.info("{} {}",cookie.getName(),cookie.getValue());
//            long idNum=Long.parseLong(id);
            switch (cookie.getName()) {
                case "student":
                    log.info("== student id is {} ==", id);
                    return "studentIndex.html";

                case "teacher":
                    log.info("== teacher id is {} ==", id);
                    return "teacherIndex.html";

                case "admin":
                    log.info("== admin id is {} ==", id);
                    return "index.html";

                default:
//                    log.info("== HomeController noting cookie ==");
            }
        }

        /**
         * 将登录页设置为主页
         */
        log.info("== login page == ");
        return "/login/index.html";

    }
}
