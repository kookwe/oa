package com.offcn.service.daily;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.beans.daily.*;
import com.offcn.dao.daily.BaoxiaoMapper;
import com.offcn.dao.daily.NoticeMapper;
import com.offcn.dao.daily.TaskMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DailyServiceImpl implements DailyService {
    @Autowired
    TaskMapper taskMapper;
    @Autowired
    NoticeMapper noticeMapper;
    @Autowired
    BaoxiaoMapper baoxiaoMapper;

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

    @Override
    public List<Notice> getLastNotice() {
        return noticeMapper.getLastNotice();
    }

    @Override
    public Notice getNoticeByNid(int nid) {
        return noticeMapper.selectByPrimaryKey(nid);
    }

    @Override
    public int saveBaoxiao(Baoxiao bx,int flag) {
        if(flag!=0){
            return baoxiaoMapper.updateByPrimaryKeySelective(bx);
        }else {
            return baoxiaoMapper.insertSelective(bx);
        }

    }

    @Override
    public PageInfo<BaoXiaoView> getBaoList(int pageNum, int flag) {
        PageHelper.startPage(pageNum, 2);
        List<BaoXiaoView> bxlist = baoxiaoMapper.getBxlist(flag);
        PageInfo<BaoXiaoView> info = new PageInfo<>(bxlist);
        return info;
    }

    @Override
    public Baoxiao getBxByBxid(String bxid) {
        return baoxiaoMapper.selectByPrimaryKey(bxid);
    }

    @Override
    public int updateBXstatus(Baoxiao baoxiao) {
        return baoxiaoMapper.updateByPrimaryKeySelective(baoxiao);
    }

    @Override
    public List<Baoxiao> getMyBxList(Integer eid) {
        BaoxiaoExample example = new BaoxiaoExample();
        BaoxiaoExample.Criteria criteria = example.createCriteria();
        criteria.andEmpFkEqualTo(eid);
        return baoxiaoMapper.selectByExample(example);
    }

}
