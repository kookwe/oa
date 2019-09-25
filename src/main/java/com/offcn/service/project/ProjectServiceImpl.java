package com.offcn.service.project;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.beans.employee.Employee;
import com.offcn.beans.employee.EmployeeExample;
import com.offcn.beans.project.Analysis;
import com.offcn.beans.project.Project;
import com.offcn.dao.employee.EmployeeMapper;
import com.offcn.dao.project.AnalysisMapper;
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
    @Autowired
    AnalysisMapper analysisMapper;
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
    public int savePro(Project project) {
        return projectMapper.insertSelective(project);
    }

    @Override
    public int updatePro(Project project) {

        return projectMapper.updateByPrimaryKeySelective(project);
    }

    @Override
    public Project getById(int pid) {
        return projectMapper.selectByPrimaryKey(pid);
    }
/////////////////////////////////需求分析管理/////////////////////////////////////////
    @Override
    public List<Project> getNoNeedPro(int flag) {

        return projectMapper.getHasOrNoNeedPro(flag);
    }

    @Override
    public PageInfo<Analysis> getAnPage(int pageNum,Map map) {
        PageHelper.startPage(pageNum, 3);
        List<Analysis> alist = analysisMapper.getAnPage(map);
        PageInfo<Analysis> info = new PageInfo<>(alist);
        return info;
    }

    @Override
    public int saveAna(Analysis analysis) {
    return analysisMapper.insertSelective(analysis);
    }

    @Override
    public Analysis getAnaByPid(int pid) {

        return analysisMapper.selectByPrimaryKey(pid);
    }


}
