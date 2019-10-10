package com.offcn.dao.information;

import com.offcn.beans.information.Email;
import com.offcn.beans.information.EmailExample;
import java.util.List;
import java.util.Map;

import com.offcn.beans.information.EmailView;
import org.apache.ibatis.annotations.Param;

public interface EmailMapper {
    int countByExample(EmailExample example);

    int deleteByExample(EmailExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Email record);

    int insertSelective(Email record);

    List<Email> selectByExample(EmailExample example);

    Email selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Email record, @Param("example") EmailExample example);

    int updateByExample(@Param("record") Email record, @Param("example") EmailExample example);

    int updateByPrimaryKeySelective(Email record);

    int updateByPrimaryKey(Email record);

    List<EmailView> getemlist(Map map);
}