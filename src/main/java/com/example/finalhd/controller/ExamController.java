package com.example.finalhd.controller;


import cn.hutool.core.util.IdUtil;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.example.finalhd.entity.*;
import com.example.finalhd.service.impl.*;
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
import java.util.UUID;

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
    @Resource
    ExamRecordServiceImpl examRecordimpl;
    @Resource
    ExamQuestionRecordServiceImpl examQuestionRecordServiceimpl;
    @Resource
    ExamUserServiceImpl examUserServiceimpl;
    @Resource
    TUserServiceImpl tUserServiceimpl;


    @PostMapping("/importpeople")
    public RespBean  importpeople(@RequestBody List<Map<String,Object>> params) {

        int x=0;
        System.out.println(params);
        System.out.println(params.get(0));
        for(int i=0;i<params.size();i++)
        {
            String username=  params.get(i).get("username").toString();
            String email=  params.get(i).get("email").toString();
            String nickname=  params.get(i).get("nickName").toString();
            String classname=  params.get(i).get("ClassName").toString();
            String userid= IdUtil.simpleUUID();
            String password="123456";
            boolean flag=tUserServiceimpl.register(username,password,email,nickname,userid,classname);
          if(flag)
          {
              x++;
          }
        }
        System.out.println(params);
        return RespBean.ok("111",x);
    }
    @PostMapping("/addrandomexam")
    public RespBean addrandomexam(@RequestBody Map<String,Object> params)
    {
         Exam exam =new Exam();
         String examid= IdUtil.simpleUUID();
         exam.setExamId(examid);
         exam.setExamName((String) params.get("examname"));
         exam.setExamDescription((String) params.get("context"));
         exam.setQuestionCreatorId((String) params.get("userid"));
         Integer difficulty=Integer.valueOf((String) params.get("difficulty"));
         exam.setExamTimeLimit(Integer.valueOf((String) params.get("examtime")));
      exam.setExamStartDate(LocalDateTime.now());
      exam.setExamEndDate(LocalDateTime.now().plusDays(999));
      exam.setCreateTime(LocalDateTime.now());
      exam.setUpdateTime(LocalDateTime.now());
      exam.setExamType(1);
      int categoryid= (int) params.get("category");
        int questions= Integer.valueOf((String) params.get("questions")).intValue();
         int score=0;
         List<Question> questionList=new ArrayList<>();
         if (difficulty==1)
         {
             double easy=Math.floor(questions*0.7);

              List<Question> eazyquestions= questionServiceimpl.getrandomquestions(categoryid,(int)easy,1);

             double normal=questions-easy;
             List<Question> normalquestions= questionServiceimpl.getrandomquestions(categoryid,(int)normal,2);
             questionList=eazyquestions;
             questionList.addAll(normalquestions);

             if (questionList.size()==0)
             {
                 List<Question> difficultquestions= questionServiceimpl.getrandomquestions(categoryid,questions,3);
                 questionList.addAll(difficultquestions);
             }

         }
         if (difficulty==2)
         {
             double normal=Math.floor(questions*0.5);
             List<Question> normalquestions= questionServiceimpl.getrandomquestions(categoryid,(int)normal,2);
             double easy=Math.floor((questions-normal)*0.5);
             List<Question> eazyquestions= questionServiceimpl.getrandomquestions(categoryid,(int)easy,1);

             double difficult=questions-easy-normal;
             List<Question> difficultquestions= questionServiceimpl.getrandomquestions(categoryid,(int)difficult,3);
             questionList=eazyquestions;
             questionList.addAll(normalquestions);
             questionList.addAll(difficultquestions);
         }
         if (difficulty==3)
         {
             double difficult=Math.floor(questions*0.6);
             List<Question> difficultquestions= questionServiceimpl.getrandomquestions(categoryid,(int)difficult,3);

             double normal=questions-difficult;
             List<Question> normalquestions= questionServiceimpl.getrandomquestions(categoryid,(int)normal,2);
            questionList=normalquestions;
             questionList.addAll(difficultquestions);

             if (questionList.size()==0)
             {
                 List<Question> eazyquestions= questionServiceimpl.getrandomquestions(categoryid,questions,1);
                 questionList.addAll(eazyquestions);
             }

         }

       for (int q=0;q<questionList.size();q++)
       {
           Question question=questionList.get(q);
           ExamQuestion examQuestion=new ExamQuestion();
           examQuestion.setExamId(examid);
           examQuestion.setQuestionId(question.getQuestionId());
           examQuestion.setId(IdUtil.simpleUUID());
           examQuestionServiceimpl.save(examQuestion);
           score=score+question.getQuestionScore();
       }
            exam.setExamScore(score);
       exam.setExamSwitch(2);
        ExamUser examUser=new ExamUser();
        examUser.setExamId(examid);
        examUser.setUserId((String) params.get("userid"));
        examUserServiceimpl.save(examUser);

        examServiceimpl.save(exam);
        System.out.println(params);
        return RespBean.ok("111");
    }

    @PostMapping("/getrandomexam")
    public RespBean getrandomexan(@RequestBody Map<String,Object> params){
        System.out.println(params);
      String userid= (String) params.get("userid");
      List<JSONObject> randomexamlist=examServiceimpl.getrandomexam(userid);
        return RespBean.ok("ok",randomexamlist);
    }


    @PostMapping("/closeexam")
    public RespBean closeexam(@RequestBody Map<String,Object> params){
     String examid= (String) params.get("examId");
     Exam exam=examServiceimpl.getById(examid);
     exam.setExamSwitch(3);
     UpdateWrapper<Exam> updateWrapper =new UpdateWrapper();
     updateWrapper.eq("exam_id",examid)
             .set("exam_switch",3);
        examServiceimpl.update(updateWrapper);

        return  RespBean.ok("1");
    }



    @PostMapping("/deleteexam")
    public  RespBean deleteexam(@RequestBody List<Map<String,Object>> params){
        for (int i=0;i<params.size();i++)
        {
            Map<String,Object> examdetail=params.get(i);
             System.out.println(examdetail);
            QueryWrapper queryWrapper=new QueryWrapper();
            queryWrapper.eq("exam_id",examdetail.get("examId"));
            List<ExamRecord> examRecords=examRecordimpl.list(queryWrapper);//查询考试记录删除
            examUserServiceimpl.remove(queryWrapper);
            examRecordimpl.remove(queryWrapper);
            examQuestionRecordServiceimpl.remove(queryWrapper);
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

        List<String> userlist= (List<String>) params.get("userlist");

        int score=0;
     QueryWrapper queryWrapper=new QueryWrapper();
     queryWrapper.eq("exam_id",examdetail.get("examId"));
     examUserServiceimpl.remove(queryWrapper);
        for (int j=0;j<userlist.size();j++){
            ExamUser examUser=new ExamUser();
            examUser.setExamId((String) examdetail.get("examId"));
            examUser.setUserId(userlist.get(j));
            examUserServiceimpl.save(examUser);
        }
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
    @PostMapping("/getexamuser")
    public RespBean getexamuser(@RequestBody Map<String,Object> params)
    {
        System.out.println(params);
        QueryWrapper<ExamUser> queryWrapper =new QueryWrapper<>();
        queryWrapper.eq("exam_id",params.get("examId"));
        List<ExamUser> examUserList =examUserServiceimpl.list(queryWrapper);
        List<TUser> userList=new ArrayList<>();
        for (int i=0;i<examUserList.size();i++)
        {
            TUser tUser=tUserServiceimpl.getById(examUserList.get(i).getUserId());
            userList.add(tUser);
        }
        return RespBean.ok("1",userList);
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
        String userid= (String) params.get("userid");

        List<JSONObject> examList = examServiceimpl.selectallexam(usertype,userid);
        for(int i=0;i<examList.size();i++)
        {
           LocalDateTime examStarttime = ((Timestamp) examList.get(i).get("examStartDate")).toLocalDateTime();
           LocalDateTime examEndtime = ((Timestamp) examList.get(i).get("examEndDate")).toLocalDateTime();

            System.out.println(examEndtime);
           LocalDateTime now=LocalDateTime.now();
           System.out.println(examEndtime.compareTo(now));
           Integer examSwitch= (Integer) examList.get(i).get("examSwitch");
         if(  examStarttime.compareTo(now)<0 && examSwitch==1)
         {
           examList.get(i).put("examSwitch",2);
          UpdateWrapper<Exam> updateWrapper = new UpdateWrapper<>();
          updateWrapper.eq("exam_id",examList.get(i).get("examId"))
                  .set("exam_switch",2);
            examServiceimpl.update(updateWrapper);
         }
             examSwitch= (Integer) examList.get(i).get("examSwitch");
         if(examEndtime.compareTo(now)<0 && examSwitch==2)
            {
                examList.get(i).put("examSwitch",3);
                UpdateWrapper<Exam> updateWrapper = new UpdateWrapper<>();
                updateWrapper.eq("exam_id",examList.get(i).get("examId"))
                        .set("exam_switch",3);
                examServiceimpl.update(updateWrapper);

            }


        }
            return RespBean.ok("查询成功", examList);



    }
    @PostMapping("/addexam")
    public RespBean addexam(@RequestBody Map<String,Object> params) {
        List<Long> examtime= (List<Long>) params.get("examtime");
        Instant starttimestamp = Instant.ofEpochMilli(examtime.get(0));
        Instant endtimestamp = Instant.ofEpochMilli(examtime.get(1));
        LocalDateTime starttime= LocalDateTime.ofInstant(starttimestamp, ZoneId.systemDefault());
        LocalDateTime endtime= LocalDateTime.ofInstant(endtimestamp, ZoneId.systemDefault());

        Exam exam=new Exam();
        String examid= IdUtil.simpleUUID();
        exam.setExamId(examid);
        exam.setExamReview(Integer.valueOf(params.get("review").toString()));
        exam.setExamName((String) params.get("name"));
        exam.setExamDescription((String) params.get("context"));
        exam.setQuestionCreatorId((String) params.get("userid"));
        exam.setExamType(0);
        exam.setExamStartDate(starttime);
        exam.setExamEndDate(endtime);
        exam.setExamTimeLimit(Integer.valueOf((String) params.get("time")));
        List<String> userlist= (List<String>) params.get("userlist");

        for (int j=0;j<userlist.size();j++){
            ExamUser examUser=new ExamUser();
            examUser.setExamId(examid);
            examUser.setUserId(userlist.get(j));
         examUserServiceimpl.save(examUser);
        }
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

        return RespBean.ok("添加成功");
    }

}
