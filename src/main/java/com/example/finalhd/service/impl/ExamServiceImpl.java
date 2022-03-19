package com.example.finalhd.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.example.finalhd.entity.Exam;
import com.example.finalhd.mapper.ExamMapper;
import com.example.finalhd.service.ExamService;
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
 * @since 2022-03-07
 */
@Service
public class ExamServiceImpl extends ServiceImpl<ExamMapper, Exam> implements ExamService {
    @Resource
    ExamMapper examMapper;
    @Override
    public List<JSONObject> selectallexam(Integer usertype, String userid) {
        return examMapper.selectallexam(usertype,userid);
    }

    @Override
    public List<JSONObject> selectexamanswer() {
        return examMapper.selectexamanswer();
    }
}
