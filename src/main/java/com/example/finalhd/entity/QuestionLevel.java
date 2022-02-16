package com.example.finalhd.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 问题的难易度级别
 * </p>
 *
 * @author zhang
 * @since 2022-02-16
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="QuestionLevel对象", description="问题的难易度级别")
public class QuestionLevel implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "题目难易度的主键")
    @TableId(value = "question_level_id", type = IdType.AUTO)
    private Integer questionLevelId;

    @ApiModelProperty(value = "题目难易度名称")
    private String questionLevelName;

    @ApiModelProperty(value = "题目难易度的描述")
    private String questionLevelDescription;


}
