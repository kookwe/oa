package com.offcn.controller.daily;

import com.offcn.beans.daily.Task;
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
    public String getTaskList(Model model,
                              @RequestParam(defaultValue = "1") int pageNum,
                              @RequestParam(defaultValue = "0") int cid,
                              String keyword,
                              @RequestParam(defaultValue = "0") int orderby
    ) {
        //用map接收参数
        Map map = new HashMap<>();
        map.put("cid", cid);
        map.put("keyword", keyword);
        map.put("orderby", orderby);



        return "task";
    }
}
