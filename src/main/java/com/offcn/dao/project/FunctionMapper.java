package com.offcn.dao.project;

import com.offcn.beans.project.Function;
import com.offcn.beans.project.FunctionExample;
import java.util.List;
import java.util.Map;

import com.offcn.beans.project.FunctionView;
import org.apache.ibatis.annotations.Param;

public interface FunctionMapper {
    long countByExample(FunctionExample example);

    int deleteByExample(FunctionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Function record);

    int insertSelective(Function record);

    List<Function> selectByExample(FunctionExample example);

    Function selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Function record, @Param("example") FunctionExample example);

    int updateByExample(@Param("record") Function record, @Param("example") FunctionExample example);

    int updateByPrimaryKeySelective(Function record);

    int updateByPrimaryKey(Function record);

    List<FunctionView> getFuncPage(Map map);
}