package com.example.finalhd.service.impl;

import com.example.finalhd.entity.Question;
import com.example.finalhd.mapper.QuestionMapper;
import com.example.finalhd.service.QuestionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
    @Override
    public List<Question> selectallquestion() {

        return questionMapper.selectallquestion();
    }

    @Override
    public int deletequestion(String questionid) {
        return questionMapper.deletequestion(questionid);
    }

    @Override
    public int deletequestionoption(String questionoptionid) {
        return questionMapper.deletequestionoption(questionoptionid);
    }


}
