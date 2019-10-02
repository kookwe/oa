package com.offcn.service.project;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.beans.employee.Employee;
import com.offcn.beans.employee.EmployeeExample;
import com.offcn.beans.project.*;
import com.offcn.dao.employee.EmployeeMapper;
import com.offcn.dao.project.*;
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
    @Autowired
    ModuleMapper moduleMapper;
    @Autowired
    FunctionMapper functionMapper;
    @Autowired
    AttachmentMapper attachmentMapper;
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

    @Override
    public List<Project> getAllpro() {

        return projectMapper.selectByExample(null);
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
    /////////////////////////////////模块管理/////////////////////////////////////////
    @Override
    public int saveMod(Module module) {
        return moduleMapper.insertSelective(module);
    }

    @Override
    public PageInfo<ModuleView> getMoPage(int pageNum, Map map) {
        PageHelper.startPage(pageNum, 2);
        List<ModuleView> mlist = moduleMapper.getModPage(map);
        PageInfo<ModuleView> info = new PageInfo<>(mlist);
        return info;
    }

    @Override
    public List<Module> getModByAid(int aid) {
        ModuleExample example = new ModuleExample();
        ModuleExample.Criteria criteria = example.createCriteria();
        criteria.andAnalysisFkEqualTo(aid);
        return moduleMapper.selectByExample(example);
    }
    ////////////////////////////////////////功能管理/////////////////////////////////////////////

    @Override
    public PageInfo<FunctionView> getFuncPage(int pageNum, Map map) {
        PageHelper.startPage(pageNum, 2);
        List<FunctionView> flist = functionMapper.getFuncPage(map);
        PageInfo<FunctionView> info = new PageInfo<>(flist);
        return info;
    }

    @Override
    public int saveFunction(Function function) {

        return functionMapper.insertSelective(function);
    }

    @Override
    public PageInfo<AttachmentView> getAttPage(int pageNum, Map map) {
        PageHelper.startPage(pageNum, 2);
        List<AttachmentView> attlist = attachmentMapper.getAttPage(map);
        PageInfo<AttachmentView> info = new PageInfo<>(attlist);
        return info;

    }

    @Override
    public int saveAtt(Attachment attachment) {
        return attachmentMapper.insertSelective(attachment);
    }

    @Override
    public List<Function> getFuncByModId(int modid) {
        FunctionExample example = new FunctionExample();
        FunctionExample.Criteria criteria = example.createCriteria();
        criteria.andModeleFkEqualTo(modid);
        return functionMapper.selectByExample(example);
    }

    @Override
    public int deletePro(List<Integer> ids) {
        ProjectExample example = new ProjectExample();
        ProjectExample.Criteria criteria = example.createCriteria();
        criteria.andPidIn(ids);
        return projectMapper.deleteByExample(example);
    }

    @Override
    public int deleteNeed(List<Integer> ids) {
        AnalysisExample example = new AnalysisExample();
        AnalysisExample.Criteria criteria = example.createCriteria();
        criteria.andIdIn(ids);
        return analysisMapper.deleteByExample(example);
    }

    @Override
    public Analysis getAnaById(int aid) {

        return analysisMapper.selectByPrimaryKey(aid);
    }

    @Override
    public int saveUpAn(Analysis analysis) {
        return analysisMapper.updateByPrimaryKeySelective(analysis);
    }

    @Override
    public List<Analysis> getAllAn() {
        return analysisMapper.selectByExample(null);
    }

    @Override
    public Attachment getAttById(int id) {

        return attachmentMapper.getAttById(id);
    }


}
