package com.example.finalhd.mapper;

import com.alibaba.fastjson.JSONObject;
import com.example.finalhd.entity.ExamRecord;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhang
 * @since 2022-03-19
 */
public interface ExamRecordMapper extends BaseMapper<ExamRecord> {
    List<JSONObject> getrecord(String userid);
}
