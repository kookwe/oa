package com.offcn.service.project;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.beans.employee.Employee;
import com.offcn.beans.employee.EmployeeExample;
import com.offcn.beans.project.Project;
import com.offcn.dao.employee.EmployeeMapper;
import com.offcn.dao.project.ProjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class ProjectServiceImpl implements ProjectService {
    @Autowired
    ProjectMapper projectMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Override
    public PageInfo<Project> getPage(int pageNum, Map map) {
        PageHelper.startPage(pageNum, 3);
        List<Project> plist = projectMapper.getByPage(map);
        PageInfo<Project> info = new PageInfo<>(plist);
        return info;
    }

    @Override
    public List<Employee> getManager() {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andPFkEqualTo(4);
        List<Employee> elist = employeeMapper.selectByExample(example);
        return elist;
    }

    @Override
    public int updatePro(Project project) {
        return projectMapper.insertSelective(project);
    }

    @Override
    public int savePro(Project project) {

        return projectMapper.updateByPrimaryKeySelective(project);
    }
}
