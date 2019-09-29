package com.offcn.controller.daily;

import com.offcn.beans.daily.Task;
import com.offcn.beans.employee.Employee;
import com.offcn.service.daily.DailyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
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
}
