package com.cls.generator.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.cls.common.entity.QueryRequest;
import com.cls.generator.entity.Column;
import com.cls.generator.entity.Table;
import com.cls.generator.mapper.GeneratorMapper;
import com.cls.generator.service.IGeneratorService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author WeiMaomao
 */
@Service
@RequiredArgsConstructor
public class GeneratorServiceImpl implements IGeneratorService {

    private final GeneratorMapper generatorMapper;

    @Override
    public List<String> getDatabases(String databaseType) {
        return generatorMapper.getDatabases(databaseType);
    }

    @Override
    public PageInfo<Table> getTables(String tableName, QueryRequest request, String databaseType, String schemaName) {

        PageHelper.startPage(request.getPageNum(), request.getPageSize());
        List<Table> tables = generatorMapper.getTables(tableName, databaseType, schemaName);
        PageInfo pageInfo = new PageInfo(tables);
        return pageInfo;

    }

    @Override
    public List<Column> getColumns(String databaseType, String schemaName, String tableName) {
        return generatorMapper.getColumns(databaseType, schemaName, tableName);
    }
}
