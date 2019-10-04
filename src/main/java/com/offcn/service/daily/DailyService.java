package com.offcn.service.daily;

import com.github.pagehelper.PageInfo;
import com.offcn.beans.daily.Task;
import com.offcn.beans.daily.TaskView;

import java.util.Map;

public interface DailyService {
    int addTask(Task task);


    PageInfo<TaskView> getTaskPage(int pageNum, Map map);

    Task getTaskById(int tid);
}
