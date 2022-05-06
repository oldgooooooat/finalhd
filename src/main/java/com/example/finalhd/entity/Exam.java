package com.example.finalhd.entity;

import java.time.LocalDateTime;
import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableId;
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
 * @since 2022-03-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="Exam对象", description="")
public class Exam implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "exam_id")
    private String examId;

    private String examName;

    private String examDescription;

    private Integer examScore;

    private Integer examSwitch;
    private Integer examTimeLimit;
    private Integer examType;
    private Integer examReview;
    @ApiModelProperty(value = "题目创建者的用户id")
    private String questionCreatorId;

    private LocalDateTime examStartDate;

    private LocalDateTime examEndDate;


    @ApiModelProperty(value = "创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty(value = "更新时间")
    private LocalDateTime updateTime;


}
