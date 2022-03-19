package com.example.finalhd.controller;


import cn.hutool.core.util.IdUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.example.finalhd.entity.*;
import com.example.finalhd.service.impl.*;
import com.example.finalhd.util.RespBean;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.*;

@RestController
@RequestMapping("/answer")
public class AnswerController {
    @Resource
    QuestionServiceImpl questionServiceimpl;
    @Resource
    QuestionOptionServiceImpl questionOptionServiceimpl;
    @Resource
    ExamServiceImpl examServiceimpl;
    @Resource
    ExamQuestionServiceImpl examQuestionServiceimpl;
    @Resource
    ExamRecordServiceImpl examRecordServiceimpl;
    @PostMapping("/submitexam")
    public RespBean submitexam( @RequestBody Map<String,Object> params)
    {

        List<Map<String,Object>> questions = (List<Map<String, Object>>) params.get("questions");
        Map<String,Object> examlist= (Map<String, Object>) params.get("examlist");
        Map<String,Object> userdetail= (Map<String, Object>) params.get("userdetail");
      ExamRecord examRecord= new ExamRecord();
      examRecord.setRecordId(IdUtil.simpleUUID());
      examRecord.setExamId((String) examlist.get("examId"));
      examRecord.setCreateTime(LocalDateTime.now());

        examRecord.setUserId((String) userdetail.get("userid"));


       float score=0;
       for (int i=0;i<questions.size();i++)
       {

           Map<String,Object> questionmap = (Map<String, Object>) questions.get(i).get("question");
           String questionid= (String) questionmap.get("questionId");
           Question question=questionServiceimpl.getById(questionid);

           if(question.getQuestionTypeId()==2) //批改多选问题的逻辑
           {
               List<String> answer= (List<String>) questions.get(i).get("answer");
               String rightanswer=question.getQuestionAnswerOptionIds();
               String[] retval= rightanswer.split("-");
               int k=0;
               if (answer.size()>retval.length)
               {

                System.out.println("全错"); //选中答案数比正确答案数量多，有错误答案直接全错
               }
               else{
                for(int j=0;j<answer.size();j++)
                {
                    for (int l=0;l<retval.length;l++)//判断对的答案数量
                    {
                        if(retval[l].equals(answer.get(j)))
                        {
                            k++;
                            break;
                        }
                    }
                }

                if(k==0)
                {
                    System.out.println("全错");
                }
                if (k<retval.length&&k!=0)
                {
                    score=score+((float)(question.getQuestionScore())/2);
                    System.out.println("对一半");//少选正确答案
                }
                if(k==retval.length)
                {
                    score=score+question.getQuestionScore();
                    System.out.println("全对");//答案全部正确
                }
               }
           }
           else      //批改非多选问题逻辑
           {
               String answer= (String) questions.get(i).get("answer");
               String retval=question.getQuestionAnswerOptionIds();
               if(retval.equals(answer))
               {
                   score=score+question.getQuestionScore();
                   System.out.println("正确");
               }
               else
               {
                   System.out.println("错误");
               }
           }

       }
       System.out.println(score);
      examRecord.setAnswerScore(score);
      examRecordServiceimpl.save(examRecord);

//        System.out.println(params);
        return RespBean.ok("111");
    }
    @PostMapping("/selectexamquestion")
    public RespBean selectexamquestion(@RequestBody Map<String,Object> params){

        String examId= (String) params.get("examId");
        QueryWrapper<ExamQuestion> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("exam_id",examId);
        List<ExamQuestion> questionids=examQuestionServiceimpl.list(queryWrapper);
        List questionlist=new ArrayList();
        for (int i=0;i<questionids.size();i++)
        {
            String questionid=questionids.get(i).getQuestionId();
           Question question=questionServiceimpl.getById(questionid);
           String questionansweroption=question.getQuestionOptionIds();
           List<QuestionOption> questionansweroptions =new ArrayList();
            for (String retval : questionansweroption.split("-")) {
                questionansweroptions.add(questionOptionServiceimpl.getById(retval));
            }
            HashMap questions = new HashMap();
            questions.put("question",question);
            questions.put("questionoptions",questionansweroptions);
//            questionlist.add(question);
//            questionlist.add(questionansweroptions);

            questionlist.add(questions);
        }
        String json= JSON.toJSONString(questionlist);
        System.out.println(json);
        return RespBean.ok("111",json);

    }


    @GetMapping("/selectexamanswer")
    public RespBean selectexamanswer(){
        List<JSONObject> examList = examServiceimpl.selectexamanswer();
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

    @PostMapping("/randomquestion")
    public RespBean randomquestion(@RequestBody Map<String,Object> params){

        Integer category = (Integer)params.get("category");
        Integer questiontype = (Integer)params.get("questiontype");
          JSONObject randomquestion=questionServiceimpl.randomquestion(category,questiontype);
          if(randomquestion!=null) {
              String questionpotion = (String) randomquestion.get("questionOptionIds");
              List<QuestionOption> questionOptions = new ArrayList<>();
              for (String retval : questionpotion.split("-")) {
                  questionOptions.add(questionOptionServiceimpl.getById(retval));
              }
              String questionansweroption = (String) randomquestion.get("questionAnswerOptionIds");
              List<QuestionOption> questionanswerOption = new ArrayList<>();
              for (String retval : questionansweroption.split("-")) {
                  questionanswerOption.add(questionOptionServiceimpl.getById(retval));
              }
              List<Object> returnlist = new ArrayList<>();
              returnlist.add(randomquestion);
              returnlist.add(questionOptions);
              returnlist.add(questionanswerOption);


              return RespBean.ok("1", returnlist);
          }
          else
          {
              return RespBean.error("该科目没有此类问题");
          }
    }

}
