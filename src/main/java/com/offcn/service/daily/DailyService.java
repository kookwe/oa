package com.offcn.service.daily;

import com.github.pagehelper.PageInfo;
import com.offcn.beans.daily.Notice;
import com.offcn.beans.daily.Task;
import com.offcn.beans.daily.TaskView;

import java.util.List;
import java.util.Map;

public interface DailyService {
    int addTask(Task task);


    PageInfo<TaskView> getTaskPage(int pageNum, Map map);

    Task getTaskById(int tid);

    int editTask(Task task);

    PageInfo<TaskView> getMyTaskPage(int pageNum, Map map);

    int updateStatus(int st, int tid);

    List<Notice> getLastNotice();

    Notice getNoticeByNid(int nid);
}
