package com.offcn.service.daily;

import com.offcn.beans.daily.Task;
import com.offcn.dao.daily.TaskMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DailyServiceImpl implements DailyService {
    @Autowired
    TaskMapper taskMapper;
    @Override
    public int addTask(Task task) {

        return taskMapper.insertSelective(task);
    }
}
