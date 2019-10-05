package com.offcn.dao.daily;

import com.offcn.beans.daily.Task;
import com.offcn.beans.daily.TaskExample;
import java.util.List;
import java.util.Map;

import com.offcn.beans.daily.TaskView;
import org.apache.ibatis.annotations.Param;

public interface TaskMapper {
    long countByExample(TaskExample example);

    int deleteByExample(TaskExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Task record);

    int insertSelective(Task record);

    List<Task> selectByExample(TaskExample example);

    Task selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Task record, @Param("example") TaskExample example);

    int updateByExample(@Param("record") Task record, @Param("example") TaskExample example);

    int updateByPrimaryKeySelective(Task record);

    int updateByPrimaryKey(Task record);

    List<TaskView> getTasklist(Map map);

    List<TaskView> getMyTaskList(Map map);
}