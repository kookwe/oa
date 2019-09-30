package com.offcn.service.project;

import com.github.pagehelper.PageInfo;
import com.offcn.beans.employee.Employee;
import com.offcn.beans.project.*;

import java.util.List;
import java.util.Map;

public interface ProjectService {

    PageInfo<Project> getPage(int pageNum, Map map);

    List<Employee> getManager();

    int updatePro(Project project);

    int savePro(Project project);

    Project getById(int pid);

    List<Project> getAllpro();
    //////////////////////////////////需求///////////////////////////////////////

    List<Project> getNoNeedPro(int flag);

    PageInfo<Analysis> getAnPage(int pageNum,Map map);


    int saveAna(Analysis analysis);

    Analysis getAnaByPid(int pid);
    //////////////////////////////////模块管理///////////////////////////////////////
    int saveMod(Module module);

    PageInfo<ModuleView> getMoPage(int pageNum, Map map);

    List<Module> getModByAid(int aid);

    ////////////////////////////////////////功能管理/////////////////////////////////////////////

    PageInfo<FunctionView> getFuncPage(int pageNum, Map map);


    int saveFunction(Function function);

    PageInfo<AttachmentView> getAttPage(int pageNum, Map map);

    int saveAtt(Attachment attachment);

    List<Function> getFuncByModId(int modid);

    int deletePro(List<Integer> ids);

    int deleteNeed(List<Integer> ids);

    Analysis getAnaById(int aid);

    int saveUpAn(Analysis analysis);

    List<Analysis> getAllAn();
}
