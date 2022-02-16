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
 * 题目类别表
 * </p>
 *
 * @author zhang
 * @since 2022-02-16
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="QuestionCategory对象", description="题目类别表")
public class QuestionCategory implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "问题类别表的主键")
    @TableId(value = "question_category_id", type = IdType.AUTO)
    private Integer questionCategoryId;

    @ApiModelProperty(value = "问题类别名称")
    private String questionCategoryName;

    @ApiModelProperty(value = "问题类别的描述")
    private String questionCategoryDescription;


}
