package com.offcn.dao.project;

import com.offcn.beans.project.Attachment;
import com.offcn.beans.project.AttachmentExample;
import java.util.List;
import java.util.Map;

import com.offcn.beans.project.AttachmentView;
import org.apache.ibatis.annotations.Param;

public interface AttachmentMapper {
    long countByExample(AttachmentExample example);

    int deleteByExample(AttachmentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Attachment record);

    int insertSelective(Attachment record);

    List<Attachment> selectByExample(AttachmentExample example);

    Attachment selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Attachment record, @Param("example") AttachmentExample example);

    int updateByExample(@Param("record") Attachment record, @Param("example") AttachmentExample example);

    int updateByPrimaryKeySelective(Attachment record);

    int updateByPrimaryKey(Attachment record);

    List<AttachmentView> getAttPage(Map map);

    Attachment getAttById(int id);
}