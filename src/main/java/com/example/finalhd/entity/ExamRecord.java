package com.example.finalhd.entity;

import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhang
 * @since 2022-03-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("exam_record")
@ApiModel(value="ExamRecord对象", description="")
public class ExamRecord implements Serializable {

    private static final long serialVersionUID = 1L;
    @TableId(value = "record_id")
    private String recordId;

    private String examId;

    private Float answerScore;

    @ApiModelProperty(value = "创建时间")
    private LocalDateTime createTime;

    private String userId;


}
