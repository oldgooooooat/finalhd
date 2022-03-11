package com.example.finalhd.controller;


import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.finalhd.entity.Exam;
import com.example.finalhd.entity.ExamQuestion;
import com.example.finalhd.entity.Question;
import com.example.finalhd.service.impl.ExamQuestionServiceImpl;
import com.example.finalhd.service.impl.ExamServiceImpl;
import com.example.finalhd.service.impl.QuestionServiceImpl;
import com.example.finalhd.util.RespBean;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhang
 * @since 2022-03-07
 */
@RestController
@RequestMapping("/exam")
public class ExamController {
    @Resource
    ExamServiceImpl examServiceimpl;
    @Resource
    QuestionServiceImpl questionServiceimpl;
    @Resource
    ExamQuestionServiceImpl examQuestionServiceimpl;
    @PostMapping("/getexamquestion")
    public RespBean getexamquestion(@RequestBody Map<String,Object> params){
        System.out.println(params);
        QueryWrapper<ExamQuestion> queryWrapper =new QueryWrapper<>();
        queryWrapper.eq("exam_id",params.get("examId"));
        List<ExamQuestion> examQuestionList =examQuestionServiceimpl.list(queryWrapper);
        List<Question> questionList=new ArrayList<>();
        for (int i=0;i<examQuestionList.size();i++)
        {
           Question question=questionServiceimpl.getById(examQuestionList.get(i).getQuestionId());
           questionList.add(question);
        }
        return RespBean.ok("1",questionList);
    }
    @GetMapping("/getallexam")
    public RespBean getexam()
    {
      List<Exam> examList=examServiceimpl.list();
        return RespBean.ok("查询成功",examList);
    }
    @PostMapping("/addexam")
    public RespBean addexam(@RequestBody Map<String,Object> params) {
        System.out.println(params);
        List<Long> examtime= (List<Long>) params.get("examtime");
        Instant starttimestamp = Instant.ofEpochMilli(examtime.get(0));
        Instant endtimestamp = Instant.ofEpochMilli(examtime.get(1));
        LocalDateTime starttime= LocalDateTime.ofInstant(starttimestamp, ZoneId.systemDefault());
        LocalDateTime endtime= LocalDateTime.ofInstant(endtimestamp, ZoneId.systemDefault());

        Exam exam=new Exam();
        String examid= IdUtil.simpleUUID();
        exam.setExamId(examid);
        exam.setExamName((String) params.get("name"));
        exam.setExamDescription((String) params.get("context"));

        exam.setExamStartDate(starttime);
        exam.setExamEndDate(endtime);
        exam.setExamTimeLimit(Integer.valueOf((String) params.get("time")));
        List<String> answerlist= (List<String>) params.get("answer");
        int score=0;
        for (int i=0;i<answerlist.size();i++)
        {
            Question question=questionServiceimpl.getById(answerlist.get(i));
            ExamQuestion examQuestion=new ExamQuestion();
            examQuestion.setExamId(examid);
            examQuestion.setQuestionId(question.getQuestionId());
            examQuestion.setId(IdUtil.simpleUUID());
             examQuestionServiceimpl.save(examQuestion);
            score=score+question.getQuestionScore();
        }
        exam.setExamScore(score);
        exam.setCreateTime(LocalDateTime.now());
        examServiceimpl.save(exam);
System.out.println(params);
        return RespBean.ok("添加成功");
    }

}
