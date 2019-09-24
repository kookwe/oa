package com.offcn.service.project;

import com.github.pagehelper.PageInfo;
import com.offcn.beans.employee.Employee;
import com.offcn.beans.project.Project;

import java.util.List;
import java.util.Map;

public interface ProjectService {

    PageInfo<Project> getPage(int pageNum, Map map);

    List<Employee> getManager();

    int updatePro(Project project);

    int savePro(Project project);
}
