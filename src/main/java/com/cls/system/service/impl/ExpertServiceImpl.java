package com.cls.system.service.impl;

import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import com.cls.common.entity.QueryRequest;
import com.cls.system.entity.Expert;
import com.cls.system.mapper.ExpertMapper;
import com.cls.system.service.IExpertService;
import com.github.pagehelper.PageHelper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation;
import lombok.RequiredArgsConstructor;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.github.pagehelper.PageInfo;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import java.io.InputStream;
import java.util.*;

/**
 * 专家表 Service实现
 *
 * @author Carey
 * @date 2020-11-06 10:47:30
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ExpertServiceImpl extends ServiceImpl<ExpertMapper, Expert> implements IExpertService {


    /**
     * 人员导入
     *
     * @return
     */
    @Override
    @Caching(evict = {@CacheEvict(value = "expert", allEntries = true)})
    @Transactional(rollbackFor = Exception.class, isolation = Isolation.READ_UNCOMMITTED)
    public void uploadExpert(InputStream inputStream) {
        // 2.应用HUtool ExcelUtil获取ExcelReader指定输入流和sheet
        ExcelReader excelReader = ExcelUtil.getReader(inputStream, 0);
        // 3.读取第二行到最后一行数据
//            List<List<Object>> employeeExcelData = excelReader.read(1, excelReader.getRowCount());
        //读取数据到map
        List<Map<String, Object>> employeeExcelData = excelReader.readAll();

        List<Expert> expertExcelList = new ArrayList<>();

        employeeExcelData.forEach(row -> {
            String name = validatedExcelData(row, "姓名");
            String company = validatedExcelData(row, "工作单位");
            String positionTypeCode = validatedExcelData(row, "行政职务");
            String titleTypeCode = validatedExcelData(row, "职称");
            String degreeTypeCode = validatedExcelData(row, "学位");
            String identityId = validatedExcelData(row, "身份证号");
            String subjectTypeCode = validatedExcelData(row, "学科分类");
            String featureTypeCode = validatedExcelData(row, "理论与实务专家");
            String districtTypeCode = validatedExcelData(row, "京内与京外专家");
            String accountId = validatedExcelData(row, "银行帐号");
            String bankName = validatedExcelData(row, "银行帐号开户行");
            String phone = validatedExcelData(row, "联系方式");
            String address = validatedExcelData(row, "地址");
            String email = validatedExcelData(row, "邮箱");

            Expert expert = new Expert();
            expert.setName(name);
            expert.setIsPublish(false);
            expert.setCompany(company);
            expert.setPositionTypeCode(positionTypeCode);
            expert.setTitleTypeCode(titleTypeCode);
            expert.setDegreeTypeCode(degreeTypeCode);
            expert.setIdentityId(identityId);
            expert.setSubjectTypeCode(subjectTypeCode);
            expert.setFeatureTypeCode(featureTypeCode);
            expert.setDistrictTypeCode(districtTypeCode);
            expert.setAccountId(accountId);
            expert.setBankName(bankName);
            expert.setPhone(phone);
            expert.setAddress(address);
            expert.setEmail(email);
            expertExcelList.add(expert);

        });
        //循环插入
        System.out.println(expertExcelList);
        expertExcelList.forEach(expert -> this.save(expert));
    }
    private String validatedExcelData(Map<String, Object> rowData, String filedName) {
        //获取字段值
        String filedValue = String.valueOf(rowData.get(filedName));
        Optional<String> validatedValueOptional = Optional.ofNullable(filedValue)
                .map(str -> StringUtils.isBlank(filedValue) ? null : filedValue);
        return validatedValueOptional.get();
    }
    @Override
    public PageInfo<Expert> findExperts(QueryRequest request, Expert expert) {
      /*  LambdaQueryWrapper<Expert> queryWrapper = new LambdaQueryWrapper<>();*/

        PageHelper.startPage(request.getPageNum(), request.getPageSize());
        List<Expert> list= this.baseMapper.findExpertDetail(expert);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @Override
    public List<Expert> findExperts(Expert expert) {
	    LambdaQueryWrapper<Expert> queryWrapper = new LambdaQueryWrapper<>();
		// TODO 设置查询条件
		return this.baseMapper.selectList(queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createExpert(Expert expert) {
        this.save(expert);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateExpert(Expert expert) {
        this.saveOrUpdate(expert);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteExpert(Expert expert) {
        LambdaQueryWrapper<Expert> wrapper = new LambdaQueryWrapper<>();
	    // TODO 设置删除条件
	    this.remove(wrapper);
	}

    @Override
    public Expert findById(Long id) {
        return this.baseMapper.selectById(id);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteExperts(String[] ids) {
        List<String> list = Arrays.asList(ids);
        // 删除专家
        boolean b = this.removeByIds(list);
        System.out.println(b);
    }
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void pubishExperts(String[] ids) {
        List<String> list = Arrays.asList(ids);
        // 发布专家
        for (String id:list) {
            Long expertId= Long.valueOf(id);
            Expert expert =new Expert();
            expert.setExpertId(expertId);
            expert.setIsPublish(true);
            this.saveOrUpdate(expert);
        }


    }
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void cancelExperts(String[] ids) {
        List<String> list = Arrays.asList(ids);
        // 取消发布专家
        for (String id:list) {
            Long expertId= Long.valueOf(id);
            Expert expert =new Expert();
            expert.setExpertId(expertId);
            expert.setIsPublish(false);
            this.saveOrUpdate(expert);
        }
    }
}
