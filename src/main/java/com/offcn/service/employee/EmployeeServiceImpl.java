package com.offcn.service.employee;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.beans.daily.Archives;
import com.offcn.beans.employee.Employee;
import com.offcn.beans.employee.EmployeeExample;
import com.offcn.dao.daily.ArchivesMapper;
import com.offcn.dao.employee.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    ArchivesMapper archivesMapper;
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

    @Override
    public Employee getArc(Integer eid) {
        return employeeMapper.getArc(eid);
    }

    @Override
    public int saveOrUpdateArc(Employee employee) {
        int i=0;
        employeeMapper.updateByPrimaryKeySelective(employee);
        String dnum = employee.getArchives().getDnum();
        if(dnum!=null&&dnum!=""){
            i = archivesMapper.updateByPrimaryKeySelective(employee.getArchives());
        }else{
            Archives archives = employee.getArchives();
            archives.setDnum(UUID.randomUUID().toString().substring(0,7));
            archives.setEmpFk(employee.getEid());

            i=archivesMapper.insertSelective(employee.getArchives());
        }
        return i;
    }

    @Override
    public PageInfo<Employee> getArclist(int pageNum) {
        PageHelper.startPage(pageNum, 2);
        List<Employee> allArc = employeeMapper.getAllArc();
        PageInfo<Employee> info = new PageInfo<>(allArc);
        return info;
    }

    @Override
    public int saveMulti(List<Archives> alist) {
        int i=0;
        for(Archives a:alist){
            archivesMapper.insertSelective(a);
            i++;
        }
        return i;
    }

    @Override
    public List<Employee> getOrtherEmps(Integer eid) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEidNotEqualTo(eid);
        return employeeMapper.selectByExample(example);
    }
}
