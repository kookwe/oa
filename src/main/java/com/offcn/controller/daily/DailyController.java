package com.offcn.controller.daily;

import com.github.pagehelper.PageInfo;
import com.offcn.beans.daily.Task;
import com.offcn.beans.daily.TaskView;
import com.offcn.beans.employee.Employee;
import com.offcn.service.daily.DailyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("daily")
public class DailyController {
    @Autowired
    DailyService dailyService;

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
                              String keyword,@RequestParam(defaultValue = "-1") int st,HttpSession session
    ) {
        Employee emp= (Employee) session.getAttribute("emp");
        Map map=new HashMap();
        map.put("cid",cid);
        map.put("kw",keyword);
        map.put("ob",orderby);
        map.put("st",st);
        map.put("eid",emp.getEid());
        PageInfo<TaskView> info = dailyService.getTaskPage(pageNum,map);
       model.addAttribute("info",info);


        return "task";
    }
}
