package com.example.finalhd.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.example.finalhd.entity.Exam;
import com.example.finalhd.entity.ExamQuestion;
import com.example.finalhd.entity.Question;
import com.example.finalhd.entity.QuestionOption;
import com.example.finalhd.service.impl.ExamQuestionServiceImpl;
import com.example.finalhd.service.impl.ExamServiceImpl;
import com.example.finalhd.service.impl.QuestionOptionServiceImpl;
import com.example.finalhd.service.impl.QuestionServiceImpl;
import com.example.finalhd.util.RespBean;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
