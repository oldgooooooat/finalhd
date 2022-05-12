package com.example.finalhd.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.example.finalhd.entity.Question;
import com.example.finalhd.mapper.QuestionMapper;
import com.example.finalhd.service.QuestionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 考试题目表 服务实现类
 * </p>
 *
 * @author zhang
 * @since 2022-02-16
 */
@Service
public class QuestionServiceImpl extends ServiceImpl<QuestionMapper, Question> implements QuestionService {
@Resource
  QuestionMapper questionMapper;

    public static void save() {
    }

    @Override
    public List<JSONObject> selectallquestion(Integer usertype,String userid,String input) {

        return questionMapper.selectallquestion(usertype,userid,input);
    }

    @Override
    public int deletequestion(String questionid) {
        return questionMapper.deletequestion(questionid);
    }

    @Override
    public int deletequestionoption(String questionoptionid) {
        return questionMapper.deletequestionoption(questionoptionid);
    }

    @Override
    public JSONObject randomquestion(Integer category,Integer questiontype,Integer difficulty) {
        return  questionMapper.randomquestion(category,questiontype,difficulty);
    }

    @Override
    public List<Question> getrandomquestions(int category, int number, int level) {
        return questionMapper.getrandomquestion(category,number,level);
    }

    @Override
    public Question examrandomquestion(Integer category, Integer type) {
        return questionMapper.examrandomquestion(category,type);
    }


}
