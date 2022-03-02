package com.example.finalhd.service;

import cn.hutool.json.JSONObject;
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
 List<JSONObject> selectallquestion();
 int deletequestion(String questionid);
 int deletequestionoption(String questionoptionid);
}
