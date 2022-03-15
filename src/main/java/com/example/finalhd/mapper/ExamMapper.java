package com.example.finalhd.mapper;

import com.alibaba.fastjson.JSONObject;
import com.example.finalhd.entity.Exam;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhang
 * @since 2022-03-07
 */
public interface ExamMapper extends BaseMapper<Exam> {
    List<JSONObject> selectallexam(Integer usertype, Integer userid);

}
