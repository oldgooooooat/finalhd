package com.example.finalhd.controller;


import com.alibaba.fastjson.JSONObject;
import com.example.finalhd.entity.QuestionOption;
import com.example.finalhd.service.impl.QuestionOptionServiceImpl;
import com.example.finalhd.service.impl.QuestionServiceImpl;
import com.example.finalhd.util.RespBean;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/answer")
public class AnswerController {
    @Resource
    QuestionServiceImpl questionServiceimpl;
    @Resource
    QuestionOptionServiceImpl questionOptionServiceimpl;

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
