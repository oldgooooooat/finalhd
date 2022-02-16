package com.example.finalhd.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.example.finalhd.entity.Question;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 考试题目表 服务类
 * </p>
 *
 * @author zhang
 * @since 2022-02-16
 */
public interface QuestionService extends IService<Question> {
 List<Question> selectallquestion();

}
