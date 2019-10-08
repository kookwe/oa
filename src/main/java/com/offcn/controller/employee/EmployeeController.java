package com.offcn.controller.employee;

import com.offcn.beans.employee.Employee;
import com.offcn.service.employee.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("emp")
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;
    @RequestMapping("login")
    public String empLogin(Model model, String username, String password, HttpSession session){
        Employee employee = employeeService.empLogin(username,password);
        if(employee!=null){
            session.setAttribute("emp", employee);
            return "index";
        }else {
            model.addAttribute("msg", "账号或密码错误，请重新输入");
            return "login";
        }

    }

    @RequestMapping("getEmps")
    @ResponseBody
    public List<Employee> getEmps(){
        return employeeService.getEmpsByPos();
    }

    @RequestMapping("getOrtherEmps")
    @ResponseBody
    public List<Employee> getOrtherEmps(HttpSession session){
        Employee emp = (Employee) session.getAttribute("emp");
        List<Employee> list = employeeService.getOrtherEmps(emp.getEid());
        return list;
    }
}
