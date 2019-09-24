package com.offcn.service.employee;

import com.offcn.beans.employee.Employee;

public interface EmployeeService {

    Employee empLogin(String username, String password);
}
