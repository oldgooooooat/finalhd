package com.example.finalhd.mapper;

import com.alibaba.fastjson.JSONObject;
import com.example.finalhd.entity.Question;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import java.util.ArrayList;

import java.util.List;

/**
 * <p>
 * 考试题目表 Mapper 接口
 * </p>
 *
 * @author zhang
 * @since 2022-02-16
 */
public interface QuestionMapper extends BaseMapper<Question> {
//  List<Question> selectallquestion();
  int deletequestion(String questionid);
  int deletequestionoption(String questionoptionid);
  List<JSONObject> selectallquestion(Integer usertype,String userid);
  JSONObject randomquestion(Integer category,Integer questiontype);
  List<Question> getrandomquestion(int category,int number,int level);

}
