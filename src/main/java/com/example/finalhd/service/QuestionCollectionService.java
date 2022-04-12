package com.example.finalhd.service;

import com.alibaba.fastjson.JSONObject;
import com.example.finalhd.entity.QuestionCollection;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhang
 * @since 2022-04-11
 */
public interface QuestionCollectionService extends IService<QuestionCollection> {
    List<JSONObject> getallcollectionquestion(String userid);

}
