package com.example.finalhd.mapper;

import com.example.finalhd.entity.Question;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

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
  List<Question> selectallquestion();
  void addquestion(Question question);
}