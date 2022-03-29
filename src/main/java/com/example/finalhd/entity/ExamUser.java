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
 * @since 2022-03-29
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("exam_user")
@ApiModel(value="ExamUser对象", description="")
public class ExamUser implements Serializable {

    private static final long serialVersionUID = 1L;

    private String examId;

    @ApiModelProperty(value = "用户id")
    private String userId;


}
