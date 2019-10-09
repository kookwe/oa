package com.offcn.service.daily;

import com.github.pagehelper.PageInfo;
import com.offcn.beans.daily.*;

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

    int saveBaoxiao(Baoxiao bx);

    PageInfo<BaoXiaoView> getBaoList(int pageNum, int flag);

    Baoxiao getBxByBxid(String bxid);

    int updateBXstatus(Baoxiao baoxiao);

    List<Baoxiao> getMyBxList(Integer eid);
}
