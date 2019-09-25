package com.offcn.controller.project;

import com.github.pagehelper.PageInfo;
import com.offcn.beans.customer.Customer;
import com.offcn.beans.employee.Employee;
import com.offcn.beans.project.Analysis;
import com.offcn.beans.project.Module;
import com.offcn.beans.project.Project;
import com.offcn.service.customer.CustomerService;
import com.offcn.service.project.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.awt.*;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.awt.SystemColor.info;

@Controller
@RequestMapping("pro")
public class ProjectController {
    @Autowired
    ProjectService projectService;
    @Autowired
    CustomerService customerService;

    /**
     * 显示项目基本信息方法
     *
     * @param model
     * @param pageNum
     * @param cid
     * @param keyword
     * @param orderby
     * @return
     */
    @RequestMapping
    public String getPlist(Model model,
                           @RequestParam(defaultValue = "1") int pageNum,
                           @RequestParam(defaultValue = "0") int cid,
                           String keyword,
                           @RequestParam(defaultValue = "0") int orderby
    ) {
        //用map接收参数
        Map map = new HashMap<>();
        map.put("cid", cid);
        map.put("keyword", keyword);
        map.put("orderby", orderby);
        PageInfo<Project> info = projectService.getPage(pageNum, map);

        model.addAttribute("cid", cid);
        model.addAttribute("keyword", keyword);
        model.addAttribute("orderby", orderby);
        model.addAttribute("info", info);
        return "project-base";
    }

    /**
     * 项目添加页面异步加载下拉框内容
     *
     * @return
     */
    @RequestMapping("getProDet")
    @ResponseBody
    public Map getProDet() {
        List<Customer> clist = customerService.getAll();
        List<Employee> elist = projectService.getManager();
        Map map = new HashMap();
        map.put("clist", clist);
        map.put("elist", elist);
        return map;
    }

    @RequestMapping("savePro")
    public String savePro(Project project, String mycomname) {
        project.setComname(Integer.parseInt(mycomname.split(",")[0]));
        Integer pid = project.getPid();
        int i = 0;
        if (pid != null && pid != 0) {
            i = projectService.updatePro(project);
        } else {
            i = projectService.savePro(project);
        }
        if (i > 0) {
            return "redirect:/pro";
        } else {
            return "error";
        }

    }

    @RequestMapping("getById")
    public String getById(Model model, int pid,@RequestParam(defaultValue = "0") int flag) {
        Project project = projectService.getById(pid);
        model.addAttribute("project", project);

        if(flag!=0){
            return "project-base-look";
        }
        return "project-base-edit";
    }

    ////////////////////////////////////////需求/////////////////////////////////////////////

    /**
     * 查询所有需求，以及根据条件搜索需求
     * @param model
     * @param pageNum
     * @param cid
     * @param keyword
     * @param orderby
     * @return
     */
    @RequestMapping("getAlist")
    public String getAlist(Model model,
                           @RequestParam(defaultValue = "1") int pageNum,
                           @RequestParam(defaultValue = "0") int cid,
                           String keyword,
                           @RequestParam(defaultValue = "0") int orderby
    ) {
        //用map接收参数
        Map map = new HashMap<>();
        map.put("cid", cid);
        map.put("keyword", keyword);
        map.put("orderby", orderby);
        PageInfo<Analysis> info = projectService.getAnPage(pageNum,map);

        model.addAttribute("cid", cid);
        model.addAttribute("keyword", keyword);
        model.addAttribute("orderby", orderby);
        model.addAttribute("info", info);
        return "project-need";
    }


    @RequestMapping("getNoNeedPro")
    @ResponseBody
    public List<Project> getProNoNeed(@RequestParam(defaultValue = "0") int flag) {
        List<Project> plist = projectService.getNoNeedPro(flag);

        return plist;
    }

    @RequestMapping("saveAna")
    public String saveAna(Analysis analysis,String pidandname){
        String[] str = pidandname.split(",");
        analysis.setId(Integer.valueOf(str[0]));
        analysis.setProname(str[1]);
        analysis.setAddtime(new Date()) ;
        analysis.setUpdatetime(new Date());
        projectService.saveAna(analysis);
        return "redirect:../project-need.jsp";
    }

    @RequestMapping("getAnaByPid")
    @ResponseBody
    public Analysis getAnaByPid(int pid){
        Analysis analysis = projectService.getAnaByPid(pid);
        return analysis;
    }

    @RequestMapping("saveMod")
    public String saveMod(Module module,String pidname){
        String[] str = pidname.split(",");

        return "";
    }
}
