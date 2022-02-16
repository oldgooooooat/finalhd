package com.example.finalhd.controller;


import com.example.finalhd.entity.Question;
import com.example.finalhd.service.QuestionService;
import com.example.finalhd.service.impl.QuestionServiceImpl;
import com.example.finalhd.util.RespBean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 考试题目表 前端控制器
 * </p>
 *
 * @author zhang
 * @since 2022-02-16
 */
@RestController
@RequestMapping("/question")
public class QuestionController {

@Resource
QuestionServiceImpl questionServiceimpl;
    @GetMapping("/selectallquestion")
    public RespBean selectallquestion()

    {
        List<Question> allquestion=questionServiceimpl.selectallquestion();
        if (allquestion!=null) {
            return RespBean.ok("查询成功", allquestion);
        }
        else
        {
            return  RespBean.error("查询失败");
        }
    }



}
