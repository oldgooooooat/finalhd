package com.example.finalhd.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.finalhd.entity.*;
import com.example.finalhd.service.impl.*;
import com.example.finalhd.util.RespBean;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhang
 * @since 2022-03-19
 */
@RestController
@RequestMapping("/exam-record")
public class ExamRecordController {

@Resource
    ExamRecordServiceImpl examRecordServiceimpl;
@Resource
    ExamQuestionServiceImpl examQuestionServiceimpl;
@Resource
    QuestionServiceImpl questionServiceimpl;
@Resource
    QuestionOptionServiceImpl questionOptionServiceimpl;
@Resource
    ExamQuestionRecordServiceImpl examQuestionRecordServiceimpl;
@Resource
    ExamServiceImpl examServiceimpl;
    @PostMapping("/getrecord")
    public RespBean getrecord(@RequestBody Map<String,Object> params){
      List<JSONObject> recordlist=examRecordServiceimpl.getrecord((String) params.get("userid"));
        return RespBean.ok("ok",recordlist);
    }

   @PostMapping("/getrecorddetail")
    public  RespBean getrecorddetail(@RequestBody Map<String,Object> params)
   {
       String userid= (String) params.get("UserId");
       String recordid= (String) params.get("RecordId");
       String ExamId= (String) params.get("ExamId");
       QueryWrapper<ExamQuestion> queryWrapper=new QueryWrapper<>();
       queryWrapper.eq("exam_id",ExamId);
       List<ExamQuestion> questionids=examQuestionServiceimpl.list(queryWrapper);
       List questionlist=new ArrayList();
       for (int i=0;i<questionids.size();i++)
       {
           String questionid=questionids.get(i).getQuestionId();
           Question question=questionServiceimpl.getById(questionid);
           String questionansweroption=question.getQuestionOptionIds();
           List<QuestionOption> questionansweroptions =new ArrayList();//查询问题选项
           for (String retval : questionansweroption.split("-")) {
               questionansweroptions.add(questionOptionServiceimpl.getById(retval));
           }

           String questionrightansweroption=question.getQuestionAnswerOptionIds();
           List<QuestionOption> questionrightansweroptions =new ArrayList();//查询问题正确选项
           for (String retval : questionrightansweroption.split("-")) {
               questionrightansweroptions.add(questionOptionServiceimpl.getById(retval));
           }

           QueryWrapper<ExamQuestionRecord> queryWrapper1=new QueryWrapper<>();
           queryWrapper1.eq("question_id",questionids.get(i).getQuestionId())
                   .eq("record_id",recordid);
           Map<String,Object> answeroption= examQuestionRecordServiceimpl.getMap(queryWrapper1);//查询该题的回答记录
          String answeroptions= (String) answeroption.get("question_option_id");
           List<QuestionOption> useransweroption =new ArrayList();
          if(answeroptions!=null) {
              for (String retval : answeroptions.split("-")) {
                  useransweroption.add(questionOptionServiceimpl.getById(retval));
              }
          }



           HashMap questions = new HashMap();
           questions.put("answer",useransweroption);
           questions.put("questionrightoptions",questionrightansweroptions);
//           questions.put("answer",answeroption);
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
    @PostMapping("/getexamdetail")
    public  RespBean getexamdetail(@RequestBody Map<String,Object> params)
    {
        String ExamId= (String) params.get("ExamId");
       Exam exam =examServiceimpl.getById(ExamId);

        return  RespBean.ok("1",exam);
    }
}

