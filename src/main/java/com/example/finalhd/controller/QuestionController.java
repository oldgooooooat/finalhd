package com.example.finalhd.controller;


import cn.hutool.core.util.IdUtil;
import com.example.finalhd.entity.Question;
import com.example.finalhd.entity.QuestionOption;
import com.example.finalhd.service.QuestionOptionService;
import com.example.finalhd.service.QuestionService;
import com.example.finalhd.service.impl.QuestionOptionServiceImpl;
import com.example.finalhd.service.impl.QuestionServiceImpl;
import com.example.finalhd.util.RespBean;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

    @PostMapping("/selectquestionoption")
            public  RespBean selectquestionoption(@RequestBody Map<String,Object> params)
    {
        System.out.println(params);
        List<QuestionOption> questionOptions =new ArrayList<>();
        String questionpotion=(String) params.get("questionOptionIds");
        for (String retval: questionpotion.split("-")){

            questionOptions.add(questionOptionServiceimpl.getById(retval));
        }
      System.out.println(questionOptions);
        return RespBean.ok("1",questionOptions);
    }
    @PostMapping("/deletequestion")
    public  RespBean deletequestion(@RequestBody List<Map<String,Object>> params)
        {
            System.out.println(params);
            for (int i=0;i<params.size();i++)
            {
              Map<String,Object> question=params.get(i);
              String questionid= (String) question.get("questionId");
              System.out.println(questionid);
              questionServiceimpl.deletequestion(questionid);
              String questionoption= (String) question.get("questionOptionIds");
                for (String retval: questionoption.split("-")){

                 questionServiceimpl.deletequestionoption(retval);
                }
            }
            return RespBean.ok("删除成功");
         }
    @GetMapping("/selectallquestion")
    public RespBean selectallquestion()

    {
        List<Question> allquestion=questionServiceimpl.selectallquestion();
        if (allquestion!=null) {
            return RespBean.ok("操作成功", allquestion);
        }
        else
        {
            return  RespBean.error("查询失败");
        }
    }
    @Resource
    QuestionOptionServiceImpl questionOptionServiceimpl;
    @Resource
    QuestionServiceImpl getQuestionServiceimpl;
    @PostMapping("/addquestion")
    public RespBean addquestion(@RequestBody Map<String,Object> params)

    {
        System.out.println(params);
        List<String> wanswervalue= (List<String>) params.get("wanswervalue");
        List<String> ranswervalue= (List<String>) params.get("ranswervalue");
        Question question =new Question();
        question.setQuestionId(IdUtil.simpleUUID());
        question.setQuestionName((String) params.get("questionname"));

        Integer userid= (Integer) params.get("userid");
        question.setQuestionCreatorId(Integer.toString(userid));
        question.setQuestionDescription((String) params.get("questioncontext"));
        question.setQuestionTypeId(Integer.valueOf((String) params.get("option")));
        question.setQuestionLevelId(Integer.valueOf((String) params.get("difficulty")));
//        question.setQuestionTypeId(1);
//        question.setQuestionLevelId(1);
        String questionoption=null;
        if(question.getQuestionTypeId()==1){
            QuestionOption questionOption =new QuestionOption();
            String questionansweroption=IdUtil.simpleUUID();
            questionoption=questionansweroption;
            question.setQuestionAnswerOptionIds(questionansweroption);
            questionOption.setQuestionOptionId(questionansweroption);
            questionOption.setQuestionOptionContent((String) params.get("answer"));
            questionOptionServiceimpl.save(questionOption);
         for (int i=0;i<wanswervalue.size();i++)
         {
             QuestionOption questionOption1 =new QuestionOption();
             String questionerroroption=IdUtil.simpleUUID();
             questionoption=questionoption+"-"+questionerroroption;
             questionOption1.setQuestionOptionId(questionerroroption);
             questionOption1.setQuestionOptionContent(wanswervalue.get(i));
             questionOptionServiceimpl.save(questionOption1);
         }
            question.setQuestionOptionIds(questionoption);

        }
        else if(question.getQuestionTypeId()==2){
             for(int i=0;i<ranswervalue.size();i++)
             {
                     QuestionOption questionOption2 =new QuestionOption();
                     String questionansweroption=IdUtil.simpleUUID();
                     if(i==0)
                     {
                         questionoption=questionansweroption;
                     }
                     else{
                         questionoption=questionoption+"-"+questionansweroption;

                     }
                     questionOption2.setQuestionOptionId(questionansweroption);
                     questionOption2.setQuestionOptionContent(ranswervalue.get(i));
                 questionOptionServiceimpl.save(questionOption2);
             }
             question.setQuestionAnswerOptionIds(questionoption);
            for (int i=0;i<wanswervalue.size();i++)
            {
                QuestionOption questionOption3 =new QuestionOption();
                String questionerroroption=IdUtil.simpleUUID();
                questionoption=questionoption+"-"+questionerroroption;
                questionOption3.setQuestionOptionId(questionerroroption);
                questionOption3.setQuestionOptionContent(wanswervalue.get(i));
                questionOptionServiceimpl.save(questionOption3);
            }
        }
        else if(question.getQuestionTypeId()==3){
            QuestionOption questionOption =new QuestionOption();
            String questionansweroption=IdUtil.simpleUUID();
            questionoption=questionansweroption;
            question.setQuestionAnswerOptionIds(questionansweroption);
            questionOption.setQuestionOptionId(questionansweroption);
            questionOption.setQuestionOptionContent((String) params.get("answer"));
            questionOptionServiceimpl.save(questionOption);
            question.setQuestionOptionIds(questionansweroption);
        }
       question.setQuestionOptionIds(questionoption);
        question.setCreateTime(LocalDateTime.now());

        getQuestionServiceimpl.save(question);
        System.out.println(question);
    return RespBean.ok("1");






    }




}
