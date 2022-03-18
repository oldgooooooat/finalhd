package com.example.finalhd.service;

import com.alibaba.fastjson.JSONObject;
import com.example.finalhd.entity.Exam;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhang
 * @since 2022-03-07
 */
public interface ExamService extends IService<Exam> {
    List<JSONObject> selectallexam(Integer usertype, Integer userid);
    List<JSONObject> selectexamanswer();
}
