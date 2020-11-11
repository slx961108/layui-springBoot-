package ${basePackage}.${controllerPackage};

import com.cls.common.annotation.ControllerEndpoint;
import com.cls.common.utils.MyUtil;
import com.cls.common.entity.MyConstant;
import com.cls.common.controller.BaseController;
import com.cls.common.entity.QueryRequest;
import com.cls.common.entity.ResponseVO;
import com.github.pagehelper.PageInfo;
import ${basePackage}.${entityPackage}.${className};
import ${basePackage}.${servicePackage}.I${className}Service;
import com.wuwenze.poi.ExcelKit;
import lombok.extern.slf4j.Slf4j;
import lombok.RequiredArgsConstructor;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;

/**
 * ${tableComment} Controller
 *
 * @author ${author}
 * @date ${date}
 */
@Slf4j
@Validated
@Controller
@RequiredArgsConstructor
public class ${className}Controller extends BaseController {

    private final I${className}Service ${className?uncap_first}Service;

    /**
    * ${tableComment}列表页面
    **/
    @GetMapping(MyConstant.VIEW_PREFIX + "${className?uncap_first}")
    public String ${className?uncap_first}Index(){
        return MyUtil.view("${className?uncap_first}/${className?uncap_first}");
    }

    /**
    * ${tableComment}新增页面
    * @return
    */
    @GetMapping(MyConstant.VIEW_PREFIX + "biz/${className?uncap_first}/${className?uncap_first}Add")
    public String ${className?uncap_first}Add(Model model){
        return MyUtil.view("business/${className?uncap_first}/${className?uncap_first}Add");
    }

    /**
    * ${tableComment}修改页面
    * @return
    */
    @GetMapping(MyConstant.VIEW_PREFIX + "biz/${className?uncap_first}/${className?uncap_first}Update/{${className?uncap_first}Id}")
    public String ${className?uncap_first}Update(@PathVariable Long ${className?uncap_first}Id, Model model){
        ${className} ${className?uncap_first} = ${className?uncap_first}Service.getById(${className?uncap_first}Id);
        model.addAttribute("${className?uncap_first}",${className?uncap_first});
        return MyUtil.view("business/${className?uncap_first}/${className?uncap_first}Update");
    }



    /**
    * 通知公告详情页面
    * @return
    */
    @GetMapping(MyConstant.VIEW_PREFIX + "biz/${className?uncap_first}/${className?uncap_first}Detail/{${className?uncap_first}Id}")
    public String ${className?uncap_first}Detail(@PathVariable Long ${className?uncap_first}Id, Model model){
        ${className} ${className?uncap_first} = ${className?uncap_first}Service.getById(${className?uncap_first}Id);
        model.addAttribute("${className?uncap_first}",${className?uncap_first});
        return MyUtil.view("business/${className?uncap_first}/${className?uncap_first}Detail");
    }

    @GetMapping("${className?uncap_first}")
    @ResponseBody
    @RequiresPermissions("${className?uncap_first}:list")
    public ResponseVO getAll${className}s(${className} ${className?uncap_first}) {
        return ResponseVO.success(${className?uncap_first}Service.find${className}s(${className?uncap_first}));
    }

    @GetMapping("${className?uncap_first}/list")
    @ResponseBody
    @RequiresPermissions("${className?uncap_first}:list")
    public ResponseVO ${className?uncap_first}List(QueryRequest request, ${className} ${className?uncap_first}) {
        PageInfo<${className}> pageInfo =  this.${className?uncap_first}Service.find${className}s(request, ${className?uncap_first});
        return ResponseVO.success(pageInfo);
    }

    @ControllerEndpoint(operation = "新增${className}", exceptionMessage = "新增${className}失败")
    @PostMapping("${className?uncap_first}")
    @ResponseBody
    @RequiresPermissions("${className?uncap_first}:add")
    public ResponseVO add${className}(@Valid ${className} ${className?uncap_first}) {
        this.${className?uncap_first}Service.create${className}(${className?uncap_first});
        return ResponseVO.success();
    }

    @ControllerEndpoint(operation = "多个删除${className}", exceptionMessage = "删除${className}失败")
    @PostMapping("${className?uncap_first}/deletes/{ids}")
    @ResponseBody
    @RequiresPermissions("${className?uncap_first}:delete")
    public ResponseVO delete${className}s(@PathVariable String ids) {
        String[] idArry = ids.split(StringPool.COMMA);
        this.${className?uncap_first}Service.delete${className}s(idArry);
        return ResponseVO.success();
    }


    @ControllerEndpoint(operation = "删除单个${className}", exceptionMessage = "删除${className}失败")
    @PostMapping("${className?uncap_first}/delete/{${className?uncap_first}Id}")
    @ResponseBody
    @RequiresPermissions("${className?uncap_first}:delete")
    public ResponseVO delete${className}(@PathVariable Long ${className?uncap_first}Id) {
        this.${className?uncap_first}Service.removeById(${className?uncap_first}Id);
        return ResponseVO.success();
    }

    @ControllerEndpoint(operation = "修改${className}", exceptionMessage = "修改${className}失败")
    @PostMapping("${className?uncap_first}/update")
    @ResponseBody
    @RequiresPermissions("${className?uncap_first}:update")
    public ResponseVO update${className}(${className} ${className?uncap_first}) {
        this.${className?uncap_first}Service.update${className}(${className?uncap_first});
        return ResponseVO.success();
    }

    @ControllerEndpoint(operation = "修改${className}", exceptionMessage = "导出Excel失败")
    @PostMapping("${className?uncap_first}/excel")
    @ResponseBody
    @RequiresPermissions("${className?uncap_first}:export")
    public void export(QueryRequest queryRequest, ${className} ${className?uncap_first}, HttpServletResponse response) {
        List<${className}> ${className?uncap_first}s = this.${className?uncap_first}Service.find${className}s(queryRequest, ${className?uncap_first}).getList();
        ExcelKit.$Export(${className}.class, response).downXlsx(${className?uncap_first}s, false);
    }
}
