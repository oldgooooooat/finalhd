package com.example.finalhd.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.example.finalhd.entity.QuestionCollection;
import com.example.finalhd.mapper.QuestionCollectionMapper;
import com.example.finalhd.service.QuestionCollectionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhang
 * @since 2022-04-11
 */
@Service
public class QuestionCollectionServiceImpl extends ServiceImpl<QuestionCollectionMapper, QuestionCollection> implements QuestionCollectionService {
    @Resource
    QuestionCollectionMapper questionCollectionMapper;
    @Override
    public List<JSONObject> getallcollectionquestion(String userid) {
        return questionCollectionMapper.getallcollectionquestion(userid);
    }
}
