package cn.lemon.lib.controller;

import cn.lemon.lib.entity.Grade;
import cn.lemon.lib.service.GradeService;
import cn.lemon.lib.vo.ResultVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/education/grade")
@Slf4j
public class GradeController {


    @Autowired
    GradeService gradeService;

    @GetMapping("/index.html")
    public String toClassPage() {
        return "/education/grade/index.html";
    }

    /**
     * 添加班级页面
     * */
    @GetMapping("/add.html")
    public String toGradeAddPage(Model model, @RequestParam(value = "gradeId", defaultValue = "0") Integer gradeId) {

        Grade grade = new Grade();
        if (gradeId != 0) {
            grade = gradeService.getGradeById(gradeId);
        }
        model.addAttribute("grade",grade);
        return "/education/grade/add.html";
    }
    /**
     * 我的班级页面
     * */
    @GetMapping("/mine.html")
    public String toGradeOfMineHtml(Model model, @RequestParam(value = "gradeId", defaultValue = "0") Integer gradeId) {

        return "/education/grade/mine.html";
    }
    /**
     * 添加班级
     * */
    @PostMapping
    @ResponseBody
    public ResultVO addGrade(Grade grade) {
        log.info("grade {}",grade);
        gradeService.save(grade);
        return ResultVO.SUCCESS();
    }

    /**
     * 获取我的班级
     * */
    @GetMapping("/mine")
    @ResponseBody
    public ResultVO getGradeListOfMine(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                       @RequestParam(value = "limit", defaultValue = "4") Integer limit, HttpSession session) {
        long userId = (long)session.getAttribute("userInfo");
        page -= 1;
        long total = gradeService.countOfMyGrade();
        List<Grade> gradeList = gradeService.getGradeListOfMine(userId,page,limit);
        log.info("total {},page {},limit {}",total,page,limit);
        HashMap<String,Object> data = new HashMap<>();
        data.put("total",total);
        data.put("tableList",gradeList);

        return ResultVO.SUCCESS(0,data);
    }

    @GetMapping("/myStudent.html")
    public String getMyStudentListHtml(long gradeId,Model model) {
        model.addAttribute("gradeId",gradeId);
        log.info("gradeId {}",gradeId);
        return "/education/grade/myStudent.html";
    }

    /**
     * 获取所有班级
     * */
    @GetMapping
    @ResponseBody
    public ResultVO getGradeList(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                @RequestParam(value = "limit", defaultValue = "10") Integer limit) {
        page -= 1;
        long total = gradeService.count();
        List<Grade> gradeList = gradeService.getGradeList(page,limit);
        log.info("total {},page {},limit {}",total,page,limit);
        HashMap<String,Object> data = new HashMap<>();
        data.put("total",total);
        data.put("menuList",gradeList);

        return ResultVO.SUCCESS(0,data);
    }

    @PostMapping("/delete")
    @ResponseBody
    public ResultVO deleteGrade(Grade grade) {
        gradeService.delete(grade);
        return ResultVO.SUCCESS(200);
    }
}
