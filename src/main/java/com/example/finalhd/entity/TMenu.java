package com.example.finalhd.entity;

import com.baomidou.mybatisplus.annotation.TableField;
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
 * @since 2022-04-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="TMenu对象", description="")
public class TMenu implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    private String icon;

    private String menuname;

    @TableField("hasThird")
    private String hasThird;

    private String url;

    private String children;


}
