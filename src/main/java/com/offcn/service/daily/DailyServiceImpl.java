package com.offcn.service.daily;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.beans.daily.Task;
import com.offcn.beans.daily.TaskExample;
import com.offcn.beans.daily.TaskView;
import com.offcn.dao.daily.TaskMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DailyServiceImpl implements DailyService {
    @Autowired
    TaskMapper taskMapper;
    @Override
    public int addTask(Task task) {

        return taskMapper.insertSelective(task);
    }

    @Override
    public PageInfo<TaskView> getTaskPage(int pageNum, Map map) {
        PageHelper.startPage(pageNum,2);
        List<TaskView> taskViewList = taskMapper.getTasklist(map);
        PageInfo<TaskView> info = new PageInfo<>(taskViewList);
        return info;
    }

    @Override
    public Task getTaskById(int tid) {
        return taskMapper.selectByPrimaryKey(tid);
    }

    @Override
    public int editTask(Task task) {

        return taskMapper.updateByPrimaryKeySelective(task);
    }

    @Override
    public PageInfo<TaskView> getMyTaskPage(int pageNum, Map map) {
        PageHelper.startPage(pageNum,2);
        List<TaskView> myTaskList = taskMapper.getMyTaskList(map);
        PageInfo<TaskView> info = new PageInfo<>(myTaskList);
        return info;
    }

    @Override
    public int updateStatus(int st, int tid) {
        Task task = new Task();
        task.setStatus(st);
        task.setId(tid);
        return taskMapper.updateByPrimaryKeySelective(task);
    }
}
