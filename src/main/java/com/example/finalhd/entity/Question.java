package com.example.finalhd.entity;

import java.time.LocalDateTime;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 考试题目表
 * </p>
 *
 * @author zhang
 * @since 2022-02-16
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="Question对象", description="考试题目表")
public class Question implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "题目的主键")
    private String questionId;

    @ApiModelProperty(value = "题目的名字")
    private String questionName;


    @ApiModelProperty(value = "题目创建者的用户id")
    private String questionCreatorId;

    @ApiModelProperty(value = "题目难易度级别")
    private Integer questionLevelId;

    @ApiModelProperty(value = "题目的类型，比如单选、多选、判断等")
    private Integer questionTypeId;


    @ApiModelProperty(value = "题目额外的描述")
    private String questionDescription;

    @ApiModelProperty(value = "题目的选项，用选项的id用-连在一起表示答案")
    private String questionOptionIds;

    @ApiModelProperty(value = "题目的答案，用选项的id用-连在一起表示答案")
    private String questionAnswerOptionIds;

    @ApiModelProperty(value = "创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty(value = "更新时间")
    private LocalDateTime updateTime;


}
