package com.example.finalhd.controller;


import cn.hutool.core.util.IdUtil;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.example.finalhd.entity.Question;
import com.example.finalhd.entity.QuestionCategory;
import com.example.finalhd.entity.QuestionOption;
import com.example.finalhd.mapper.QuestionMapper;
import com.example.finalhd.service.QuestionOptionService;
import com.example.finalhd.service.QuestionService;
import com.example.finalhd.service.impl.QuestionCategoryServiceImpl;
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
@Resource
QuestionCategoryServiceImpl questionCategoryServiceimpl;




   @GetMapping("/getcategory")
   public RespBean getcategory(){
       List<QuestionCategory>questionCategories=questionCategoryServiceimpl.list();
       return RespBean.ok("查询成功",questionCategories);
   }
   @PostMapping("/updatecategory")
   public RespBean updatecategory(@RequestBody Map<String,Object> params){
       UpdateWrapper<QuestionCategory> updateWrapper=new UpdateWrapper<>();
       updateWrapper.eq("question_category_id",params.get("questionCategoryId"))
               .set("question_category_name",params.get("questionCategoryName"))
               .set("question_category_description",params.get("questionCategoryDescription"));
       questionCategoryServiceimpl.update(null,updateWrapper);

       return RespBean.ok("保存成功");
   }
   @PostMapping("/savecategory")
   public RespBean savecategory(@RequestBody Map<String,Object> params)
   {
       QuestionCategory questionCategory=new QuestionCategory();
       questionCategory.setQuestionCategoryName((String) params.get("questionCategoryName"));
       questionCategory.setQuestionCategoryDescription((String) params.get("questionCategoryDescription"));
       questionCategoryServiceimpl.save(questionCategory);
       return RespBean.ok("保存成功");
   }
    @PostMapping("/changequestion")

    public  RespBean changequestion(@RequestBody Map<String,Object> params){
        Map<String,Object> questiondetail= (Map<String, Object>) params.get("questiondetail1");
        UpdateWrapper<Question> updateWrapper=new UpdateWrapper<>();
        updateWrapper.eq("question_id",questiondetail.get("questionId"))
                .set("question_name",questiondetail.get("questionName"))
                .set("question_category",questiondetail.get("questionCategoryid"))
                .set("question_level_id",questiondetail.get("questionLevelId"))
                .set("question_description",questiondetail.get("questionDescription"))
                .set("question_photos",questiondetail.get("questionPhotos"))
                .set("update_time",LocalDateTime.now());
        questionServiceimpl.update(null,updateWrapper);
        List<Map<String,Object>> questionoption= (List<Map<String, Object>>) params.get("questionoptiondetail1");
        for (int i=0;i<questionoption.size();i++)
        {
            UpdateWrapper<QuestionOption> updateWrapper1=new UpdateWrapper<>();
            updateWrapper1.eq("question_option_id",questionoption.get(i).get("questionOptionId"))
                    .set("question_option_content",questionoption.get(i).get("questionOptionContent"));
             questionOptionServiceimpl.update(null,updateWrapper1);
        }
        List<Map<String,Object>> questionoption1= (List<Map<String, Object>>) params.get("rquestionoption");
        for (int i=0;i<questionoption1.size();i++)
        {
            UpdateWrapper<QuestionOption> updateWrapper1=new UpdateWrapper<>();
            updateWrapper1.eq("question_option_id",questionoption1.get(i).get("questionOptionId"))
                    .set("question_option_content",questionoption1.get(i).get("questionOptionContent"));
            questionOptionServiceimpl.update(null,updateWrapper1);
        }

        System.out.println(params);

        return RespBean.ok("修改成功");

    }
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
        return RespBean.ok("查询成功",questionOptions);
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
    @PostMapping("/selectallquestion")
    public RespBean selectallquestion(@RequestBody Map<String,Object> params)

    {
        Integer usertype= (Integer) params.get("usertype");
        String userid= (String) params.get("userid");


        List<JSONObject> allquestion=questionServiceimpl.selectallquestion(usertype,userid);
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
        question.setQuestionCategory((Integer) params.get("category"));
        question.setQuestionCreatorId((String) params.get("userid"));
        question.setQuestionPhotos((String) params.get("photos"));
        question.setQuestionDescription((String) params.get("questioncontext"));
        question.setQuestionScore(Integer.valueOf((String) params.get("score")));
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
            System.out.println(params);
            QuestionOption questionOption =new QuestionOption();
            String questionansweroption=IdUtil.simpleUUID();
            questionoption=questionansweroption;
            question.setQuestionAnswerOptionIds(questionansweroption);
            questionOption.setQuestionOptionId(questionansweroption);
            questionOption.setQuestionOptionContent((String) params.get("answer"));
            questionOptionServiceimpl.save(questionOption);
//判断添加错误答案

            QuestionOption questionOption1=new QuestionOption();
            String questionansweroption1=IdUtil.simpleUUID();
            questionOption1.setQuestionOptionId(questionansweroption1);
            questionoption=questionoption+"-"+questionansweroption1;
            questionOption1.setQuestionOptionContent((String) params.get("pdanswer"));
            questionOptionServiceimpl.save(questionOption1);

//            question.setQuestionOptionIds(questionansweroption);
        }
       question.setQuestionOptionIds(questionoption);
        question.setCreateTime(LocalDateTime.now());

        getQuestionServiceimpl.save(question);
        System.out.println(question);
    return RespBean.ok("1");






    }




}
