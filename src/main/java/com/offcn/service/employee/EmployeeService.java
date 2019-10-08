package com.offcn.service.employee;

import com.github.pagehelper.PageInfo;
import com.offcn.beans.daily.Archives;
import com.offcn.beans.employee.Employee;

import java.util.List;

public interface EmployeeService {

    Employee empLogin(String username, String password);

    List<Employee> getEmpsByPos();

    Employee getArc(Integer eid);

    int saveOrUpdateArc(Employee employee);

    PageInfo<Employee> getArclist(int pageNum);

    int saveMulti(List<Archives> alist);

    List<Employee> getOrtherEmps(Integer eid);
}
