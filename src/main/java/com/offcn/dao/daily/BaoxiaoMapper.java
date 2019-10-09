package com.offcn.dao.daily;

import com.offcn.beans.daily.Baoxiao;
import com.offcn.beans.daily.BaoxiaoExample;
import java.util.List;

import com.offcn.beans.daily.BaoXiaoView;
import org.apache.ibatis.annotations.Param;

public interface BaoxiaoMapper {
    int countByExample(BaoxiaoExample example);

    int deleteByExample(BaoxiaoExample example);

    int deleteByPrimaryKey(String bxid);

    int insert(Baoxiao record);

    int insertSelective(Baoxiao record);

    List<Baoxiao> selectByExample(BaoxiaoExample example);

    Baoxiao selectByPrimaryKey(String bxid);

    int updateByExampleSelective(@Param("record") Baoxiao record, @Param("example") BaoxiaoExample example);

    int updateByExample(@Param("record") Baoxiao record, @Param("example") BaoxiaoExample example);

    int updateByPrimaryKeySelective(Baoxiao record);

    int updateByPrimaryKey(Baoxiao record);

    List<BaoXiaoView> getBxlist(int flag);
}