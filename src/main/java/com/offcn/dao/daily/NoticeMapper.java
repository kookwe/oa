package com.offcn.dao.daily;

import com.offcn.beans.daily.Notice;
import com.offcn.beans.daily.NoticeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface NoticeMapper {
    long countByExample(NoticeExample example);

    int deleteByExample(NoticeExample example);

    int deleteByPrimaryKey(Integer nid);

    int insert(Notice record);

    int insertSelective(Notice record);

    List<Notice> selectByExample(NoticeExample example);

    Notice selectByPrimaryKey(Integer nid);

    int updateByExampleSelective(@Param("record") Notice record, @Param("example") NoticeExample example);

    int updateByExample(@Param("record") Notice record, @Param("example") NoticeExample example);

    int updateByPrimaryKeySelective(Notice record);

    int updateByPrimaryKey(Notice record);

    //获得最近的三条消息
    List<Notice> getLastNotice();
}