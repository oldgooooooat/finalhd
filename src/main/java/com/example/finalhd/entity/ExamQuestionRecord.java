package com.example.finalhd.entity;

import com.baomidou.mybatisplus.annotation.TableName;
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
 * @since 2022-03-22
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("exam_question_record")
@ApiModel(value="ExamQuestionRecord对象", description="")
public class ExamQuestionRecord implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "题目的主键")
    private String questionId;

    private String examId;

    private String recordId;

    @ApiModelProperty(value = "题目选项表的主键")
    private String questionOptionId;

    private Integer correct;


}
