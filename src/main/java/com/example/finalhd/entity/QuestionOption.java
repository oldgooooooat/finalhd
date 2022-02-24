package com.example.finalhd.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 题目的选项
 * </p>
 *
 * @author zhang
 * @since 2022-02-16
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="QuestionOption对象", description="题目的选项")
public class QuestionOption implements Serializable {

    private static final long serialVersionUID = 1L;
    @TableId(value = "question_option_id")
    @ApiModelProperty(value = "题目选项表的主键")
    private String questionOptionId;

    @ApiModelProperty(value = "选项的内容")
    private String questionOptionContent;

    @ApiModelProperty(value = "选项的额外描述，可以用于题目答案解析")
    private String questionOptionDescription;


}
