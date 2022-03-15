package com.example.finalhd.controller;


import cn.hutool.core.util.IdUtil;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.example.finalhd.entity.Exam;
import com.example.finalhd.entity.ExamQuestion;
import com.example.finalhd.entity.Question;
import com.example.finalhd.service.impl.ExamQuestionServiceImpl;
import com.example.finalhd.service.impl.ExamServiceImpl;
import com.example.finalhd.service.impl.QuestionServiceImpl;
import com.example.finalhd.util.RespBean;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.Serializable;
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
    @PostMapping("/deleteexam")

    public  RespBean deleteexam(@RequestBody List<Map<String,Object>> params){
        for (int i=0;i<params.size();i++)
        {
            Map<String,Object> examdetail=params.get(i);
             System.out.println(examdetail);
            QueryWrapper queryWrapper=new QueryWrapper();
            queryWrapper.eq("exam_id",examdetail.get("examId"));
            List<ExamQuestion>examQuestionList=examQuestionServiceimpl.list(queryWrapper);//查询之前考试中的问题全部删除
            for(int j=0;j<examQuestionList.size();j++)
            {
                examQuestionServiceimpl.removeById(examQuestionList.get(j).getId());
            }
            String examid= (String) examdetail.get("examId");
            examServiceimpl.removeById(examid);
        }
        System.out.println(params);
        return RespBean.ok("1");
    }
    @PostMapping("/changeexam")
    public RespBean changeexam(@RequestBody Map<String,Object> params){
        System.out.println(params);
        List<String> questionids= (List<String>) params.get("answer");
        Map<String,Object> examdetail= (Map<String, Object>) params.get("examdetail");
        List<Long>examtime= (List<Long>) params.get("examtime");
        Instant starttimestamp = Instant.ofEpochMilli(examtime.get(0));
        Instant endtimestamp = Instant.ofEpochMilli(examtime.get(1));
        LocalDateTime starttime= LocalDateTime.ofInstant(starttimestamp, ZoneId.systemDefault());
        LocalDateTime endtime= LocalDateTime.ofInstant(endtimestamp, ZoneId.systemDefault());
        int score=0;
     QueryWrapper queryWrapper=new QueryWrapper();
     queryWrapper.eq("exam_id",examdetail.get("examId"));
     List<ExamQuestion>examQuestionList=examQuestionServiceimpl.list(queryWrapper);//查询之前考试中的问题全部删除
       for(int i=0;i<examQuestionList.size();i++)
       {
           examQuestionServiceimpl.removeById(examQuestionList.get(i).getId());
       }
        for(int i=0;i<questionids.size();i++)
        {
            Question question=new Question();
            question=questionServiceimpl.getById(questionids.get(i));
            score=score+question.getQuestionScore();
            ExamQuestion examQuestion=new ExamQuestion();
            examQuestion.setExamId((String) examdetail.get("examId"));
            examQuestion.setQuestionId(questionids.get(i));
            examQuestion.setId(IdUtil.simpleUUID());
            examQuestionServiceimpl.save(examQuestion);
        }
        UpdateWrapper<Exam> updateWrapper=new UpdateWrapper<>();
        updateWrapper.eq("exam_id",examdetail.get("examId"))
                .set("exam_name",examdetail.get("examName"))
                .set("exam_description",examdetail.get("examTimeLimit"))
                .set("exam_time_limit",examdetail.get("examTimeLimit"))
                .set("exam_score",score)
                .set("exam_start_date",starttime)
                .set("exam_end_date",endtime)
                .set("update_time",LocalDateTime.now());
        examServiceimpl.update(updateWrapper);
        return RespBean.ok("1");

    }
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
    @PostMapping("/getallexam")
    public RespBean getexam(@RequestBody Map<String,Object> params)
    {
        Integer usertype= (Integer) params.get("usertype");
        Integer userid= (Integer) params.get("userid");
        System.out.println(params);

        List<JSONObject> examList = examServiceimpl.selectallexam(usertype,userid);
            return RespBean.ok("查询成功", examList);



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
        Integer userid= (Integer) params.get("userid");
        exam.setQuestionCreatorId(Integer.toString(userid));

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
