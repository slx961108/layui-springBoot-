package com.cls.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.cls.common.entity.BaseEntity;
import com.wuwenze.poi.annotation.Excel;
import com.wuwenze.poi.annotation.ExcelField;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * @author WeiMaomao
 */
@Data
@TableName("sys_role")
@Excel("角色信息表")
public class Role extends BaseEntity implements Serializable {

    private static final long serialVersionUID = -4493960686192269860L;
    /**
     * 角色ID
     */
    @TableId(value = "ROLE_ID", type = IdType.AUTO)
    private Long roleId;

    /**
     * 角色名称
     */
    @TableField("ROLE_NAME")
    @ExcelField(value = "角色名称")
    @NotBlank(message = "{required}")
    @Size(max = 10, message = "{noMoreThan}")
    private String roleName;

    /**
     * 角色描述
     */
    @TableField("REMARK")
    @ExcelField(value = "角色描述")
    @Size(max = 50, message = "{noMoreThan}")
    private String remark;

    /**
     * 角色对应的菜单（按钮） id
     */
    private transient String menuIds;
}