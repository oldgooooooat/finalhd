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
 * 问题类型
 * </p>
 *
 * @author zhang
 * @since 2022-02-16
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="QuestionType对象", description="问题类型")
public class QuestionType implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "题目类型表的主键")
    @TableId(value = "question_type_id", type = IdType.AUTO)
    private Integer questionTypeId;

    @ApiModelProperty(value = "题目类型名称")
    private String questionTypeName;

    @ApiModelProperty(value = "题目类型的描述")
    private String questionTypeDescription;


}
