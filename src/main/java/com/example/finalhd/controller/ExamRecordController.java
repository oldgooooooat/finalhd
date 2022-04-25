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
import java.util.*;

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
@Resource
    QuestionCollectionServiceImpl questionCollectionServiceimpl;
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
         QueryWrapper collection=new QueryWrapper();
          collection.eq("questionid",questionid);
          collection.eq("userid",userid);
        int collectioncount=  questionCollectionServiceimpl.count(collection) ;
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
          Integer correct= (Integer) answeroption.get("correct");
          String answeroptions= (String) answeroption.get("question_option_id");

           List<QuestionOption> useransweroption =new ArrayList();
          if(answeroptions.isBlank()==false) {
              for (String retval : answeroptions.split("-")) {
                  useransweroption.add(questionOptionServiceimpl.getById(retval));
              }
          }
           if(answeroptions.isBlank()==true)
                      {
           System.out.println(111);

              QuestionOption questionOption=new QuestionOption();
              questionOption.setQuestionOptionContent("未回答");
              questionOption.setQuestionOptionId("1111111111111111111111111111111X");
              questionOption.setQuestionOptionDescription("未回答");
              useransweroption.add(0,questionOption);
          }


           Collections.shuffle(questionansweroptions);
           HashMap questions = new HashMap();
           questions.put("collectioncount",collectioncount);
           questions.put("correct",correct);
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

        return  RespBean.ok("ok",exam);
    }
    @PostMapping("/getexamresult")
    public RespBean getexamresult(@RequestBody Map<String,Object> params)
    {
       List<JSONObject> resultlist= examRecordServiceimpl.getexamresult((String) params.get("examId"));
      for (int i=0;i<resultlist.size();i++)
      {
          if(resultlist.get(i).get("record_id")==null)
          {
              resultlist.get(i).put("record_id",null);
              resultlist.get(i).put("answer_score",null);
              resultlist.get(i).put("create_time",null);
          }
         System.out.println(resultlist.get(i).get("record_id"));
      }
       System.out.println(resultlist);
        return  RespBean.ok("ok",resultlist);


    }
    @PostMapping("/addcollectionquestion")
    public RespBean addcollectionquestion(@RequestBody Map<String,Object> params)
    {
        QuestionCollection questionCollection=new QuestionCollection();

        String questionid= (String) params.get("questionid");
        String userid= (String) params.get("userid");
        questionCollection.setQuestionid(questionid);
        questionCollection.setUserid(userid);
        questionCollectionServiceimpl.save(questionCollection);
        System.out.println(params);
        return  RespBean.ok("ok");
    }
    @PostMapping("/deletecollectionquestion")
    public RespBean deletecollectionquestion(@RequestBody Map<String,Object> params)
    {
           QueryWrapper queryWrapper=new QueryWrapper();
        String questionid= (String) params.get("questionid");
        String userid= (String) params.get("userid");

         queryWrapper.eq("questionid",questionid);
         queryWrapper.eq("userid",userid);
        questionCollectionServiceimpl.remove(queryWrapper);
        System.out.println(params);
        return  RespBean.ok("ok");
    }
    @PostMapping("/getallcollectionquestion")
    public RespBean getallcollectionquestion(@RequestBody Map<String,Object> params)
    {
        System.out.println(params);
        String userid= (String) params.get("userid");
     List<JSONObject> Questionlist=questionCollectionServiceimpl.getallcollectionquestion(userid);
//        QueryWrapper queryWrapper=new QueryWrapper();
//        queryWrapper.eq("userid",userid);
//        List<QuestionCollection> Collectionlist=questionCollectionServiceimpl.list(queryWrapper);
//        List<Question> Questionlist=new ArrayList<>();
//        for(int i=0; i<Collectionlist.size();i++)
//        {
//
//          Question question=questionServiceimpl.getById(Collectionlist.get(i).getQuestionid());
//          Questionlist.add(question);
//        }

        return RespBean.ok("111",Questionlist);

    }
    @PostMapping("/deletecollection")
    public RespBean deletecollection(@RequestBody Map<String,Object> params)
    {
        String userid= (String) params.get("userid");
         String questions= (String) params.get("questions");
         List<JSONObject> questionlist= (List<JSONObject>) JSONObject.parse(questions);

         for (int i=0;i<questionlist.size();i++)
         {
            QueryWrapper queryWrapper=new QueryWrapper();
            String questionid= (String) questionlist.get(i).get("questionId");
            queryWrapper.eq("userid",userid);
            queryWrapper.eq("questionid",questionid);
            questionCollectionServiceimpl.remove(queryWrapper);


         }


        return RespBean.ok("111");
    }
    @PostMapping("/getquestioncontext")
    public RespBean getquestioncontext(@RequestBody Map<String,Object> params) {
        System.out.println(params);
      String  questionid= (String) params.get("questionId");
        Question question=questionServiceimpl.getById(questionid);

            String questionpotion = (String) params.get("questionOptionIds");
            List<QuestionOption> questionOptions = new ArrayList<>();
            for (String retval : questionpotion.split("-")) {
                questionOptions.add(questionOptionServiceimpl.getById(retval));
            }
            String questionansweroption = (String) params.get("questionAnswerOptionIds");
            List<QuestionOption> questionanswerOption = new ArrayList<>();
            for (String retval : questionansweroption.split("-")) {
                questionanswerOption.add(questionOptionServiceimpl.getById(retval));
            }
        List<Object> returnlist = new ArrayList<>();
        returnlist.add(question);
        returnlist.add(questionOptions);
        returnlist.add(questionanswerOption);

        return RespBean.ok("1",returnlist);
    }
    @PostMapping("/getwrongquestion")
    public RespBean getwrongquestion(@RequestBody Map<String,Object> params) {

        String userid= (String) params.get("userid");
        List<JSONObject> questionlist=examRecordServiceimpl.getwrongquestion(userid);
        return RespBean.ok("1",questionlist);

    }
}

