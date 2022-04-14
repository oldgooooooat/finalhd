package com.example.finalhd.service;

import com.alibaba.fastjson.JSONObject;
import com.example.finalhd.entity.ExamRecord;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhang
 * @since 2022-03-19
 */
public interface ExamRecordService extends IService<ExamRecord> {
    List<JSONObject> getrecord(String userid);
    List<JSONObject> getexamresult(String examid);
    List<JSONObject> getwrongquestion(String userid);
}
