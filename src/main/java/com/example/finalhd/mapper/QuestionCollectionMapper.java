package com.example.finalhd.mapper;

import com.alibaba.fastjson.JSONObject;
import com.example.finalhd.entity.QuestionCollection;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhang
 * @since 2022-04-11
 */
public interface QuestionCollectionMapper extends BaseMapper<QuestionCollection> {
    List<JSONObject> getallcollectionquestion(String userid);
}
