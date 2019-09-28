package com.offcn.service.employee;

import com.offcn.beans.employee.Employee;
import com.offcn.beans.employee.EmployeeExample;
import com.offcn.dao.employee.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;

    @Override
    public Employee empLogin(String username, String password) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(username);
        criteria.andPasswordEqualTo(password);
        List<Employee> emps = employeeMapper.selectByExample(example);

        if(emps!=null){
            return emps.get(0);
        }else {
            return null;
        }

    }
    //根据职位查找员工
    @Override
    public List<Employee> getEmpsByPos() {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andPFkLessThan(4);
        return employeeMapper.selectByExample(example);
    }
}
