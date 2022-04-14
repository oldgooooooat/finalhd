package com.example.finalhd.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.example.finalhd.entity.ExamRecord;
import com.example.finalhd.mapper.ExamRecordMapper;
import com.example.finalhd.service.ExamRecordService;
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
 * @since 2022-03-19
 */
@Service
public class ExamRecordServiceImpl extends ServiceImpl<ExamRecordMapper, ExamRecord> implements ExamRecordService {

    @Resource
    ExamRecordMapper examRecordMapper;
    @Override
    public List<JSONObject> getrecord(String userid) {
        return examRecordMapper.getrecord(userid);
    }

    @Override
    public List<JSONObject> getexamresult(String examid) {
        return examRecordMapper.getexamresult(examid);
    }

    @Override
    public List<JSONObject> getwrongquestion(String userid) {
        return examRecordMapper.getwrongquestion(userid);
    }

}
