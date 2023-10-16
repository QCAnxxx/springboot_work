package cn.lemon.lib.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Slf4j
public class HomeController {
    @GetMapping("/")
    public String defaultPage(){
        log.info("== login page == ");
        return "login/index.html";
    }
}
