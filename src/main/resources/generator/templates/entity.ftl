package ${basePackage}.${entityPackage};

<#if hasDate = true>
import java.util.Date;
</#if>
<#if hasBigDecimal = true>
import java.math.BigDecimal;
</#if>

import lombok.Data;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.cls.common.entity.BaseEntity;
import java.io.Serializable;
/**
 * ${tableComment} Entity
 *
 * @author ${author}
 * @date ${date}
 */
@Data
@TableName("${tableName}")
public class ${className} extends BaseEntity implements Serializable {

    <#if columns??>
    <#list columns as column>

        <#if  column.field?uncap_first!='isDelete' && column.field?uncap_first!='createTime'
        && column.field?uncap_first!= 'modifyTime' && column.field?uncap_first!='modifyBy'  && column.field?uncap_first!='createBy' >

    /**
     * ${column.remark}
     */
    <#if column.isKey = true>
    @TableId(value = "${column.name}", type = IdType.AUTO)
    <#else>
    @TableField("${column.name}")
    </#if>
    <#if (column.type = 'varchar' || column.type = 'text' || column.type = 'uniqueidentifier'
        || column.type = 'varchar2' || column.type = 'nvarchar' || column.type = 'VARCHAR2'
        || column.type = 'VARCHAR'|| column.type = 'CLOB' || column.type = 'char')>
    private String ${column.field?uncap_first};
    <#elseif column.type = 'timestamp' || column.type = 'date' || column.type = 'datetime'||column.type = 'TIMESTAMP' || column.type = 'DATE' || column.type = 'DATETIME'>
    private Date ${column.field?uncap_first};
    <#elseif column.type = 'int' || column.type = 'smallint'>
    private Integer ${column.field?uncap_first};

    <#elseif column.type = 'bigint'>
    private Long ${column.field?uncap_first};

    <#elseif column.type = 'double'>
    private Double ${column.field?uncap_first};

    <#elseif column.type = 'tinyint'>
    private Byte ${column.field?uncap_first};

    <#elseif column.type = 'decimal' || column.type = 'numeric'>
    private BigDecimal ${column.field?uncap_first};
    <#elseif column.type='bit'>
    private Boolean ${column.field?uncap_first};
    </#if>
    </#if>
    </#list>
    </#if>
}
