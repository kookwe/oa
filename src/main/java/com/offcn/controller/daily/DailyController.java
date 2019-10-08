package com.offcn.controller.daily;

import com.github.pagehelper.PageInfo;
import com.offcn.beans.daily.Notice;
import com.offcn.beans.daily.Task;
import com.offcn.beans.daily.TaskView;
import com.offcn.beans.employee.Employee;
import com.offcn.beans.project.Function;
import com.offcn.beans.project.Module;
import com.offcn.service.daily.DailyService;
import com.offcn.service.project.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("daily")
public class DailyController {
    @Autowired
    DailyService dailyService;
    @Autowired
    ProjectService projectService;

    @RequestMapping("addTask")
    public String addTask(Task task, HttpSession session){
        Employee employee = (Employee) session.getAttribute("emp");
        task.setEmpFk(employee.getEid());
        task.setStatus(0);
       int i = dailyService.addTask(task);
        return "redirect:../task-add.jsp";
    }

    @RequestMapping("getTaskList")
    public String getTaskList(Model model, @RequestParam(defaultValue = "1") int pageNum,
                              @RequestParam(defaultValue = "0")int cid,
                              @RequestParam(defaultValue = "0")int orderby,
                              String keyword,
                              @RequestParam(defaultValue = "-1") int st,
                              HttpSession session
    ) {
        Employee emp= (Employee) session.getAttribute("emp");
        Map map=new HashMap();
        map.put("cid",cid);
        map.put("keyword",keyword);
        map.put("orderby",orderby);
        map.put("st",st);
        map.put("eid",emp.getEid());
        PageInfo<TaskView> info = dailyService.getTaskPage(pageNum,map);

        model.addAttribute("cid", cid);
        model.addAttribute("keyword", keyword);
        model.addAttribute("orderby", orderby);
        model.addAttribute("st",st);
        model.addAttribute("info", info);

        return "task";
    }

    @RequestMapping("getTaskById")
    public String getTaskById(Model m,int tid){
        Task task =dailyService.getTaskById(tid);
        m.addAttribute("task",task);
            Function fun = projectService.getFunByFid(task.getFunFk());
            Module mod = projectService.getModByMid(fun.getModeleFk());
            m.addAttribute("mid",mod.getId());//回显四级菜单中的模块时使用
            m.addAttribute("aid",mod.getAnalysisFk());//回显四级菜单中的项目时使用
            return "task-edit";
    }

    @RequestMapping("editTask")
    public String editTask(Task task){
        dailyService.editTask(task);
        return "redirect:/daily/getTaskList";
    }

    /**
     * 查询出的任务是别人给我下发的任务
     * @param model
     * @param pageNum
     * @param cid
     * @param orderby
     * @param st
     * @param keyword
     * @param session
     * @return
     */
    @RequestMapping("getMyTaskList")
    public String getMyTaskList(Model model, @RequestParam(defaultValue = "1") int pageNum,
                             @RequestParam(defaultValue = "0")int cid,
                             @RequestParam(defaultValue = "0")int orderby,
                             @RequestParam(defaultValue = "0") int st,
                             String keyword,HttpSession session){
        Employee emp= (Employee) session.getAttribute("emp");
        Map map=new HashMap();
        map.put("cid",cid);
        map.put("keyword",keyword);
        map.put("orderby",orderby);
        map.put("st",st);
        map.put("eid",emp.getEid());
        PageInfo<TaskView> info = dailyService.getMyTaskPage(pageNum, map);
        model.addAttribute("info",info);
        return "task-my";
    }

    /**
     * 更新任务状态，已完成、进行中
     * @param st
     * @param tid
     * @return
     */
    @RequestMapping("updateStatus")
    public String updateStatus(int st,int tid){
        dailyService.updateStatus(st,tid);
        return "redirect:/daily/getMyTaskList";
    }

    @RequestMapping("getLastNotice")
    @ResponseBody
    public List<Notice> getLastNotice(){
        return dailyService.getLastNotice();
    }

    @RequestMapping("getNoticeByNid")
    @ResponseBody
    public Notice getNoticeByNid(int nid){
        return dailyService.getNoticeByNid(nid);
    }
}
