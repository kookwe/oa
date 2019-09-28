package com.offcn.service.employee;

import com.offcn.beans.employee.Employee;

import java.util.List;

public interface EmployeeService {

    Employee empLogin(String username, String password);

    List<Employee> getEmpsByPos();
}
