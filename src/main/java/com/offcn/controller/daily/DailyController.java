package com.offcn.controller.daily;

import com.github.pagehelper.PageInfo;
import com.offcn.beans.daily.*;
import com.offcn.beans.employee.Employee;
import com.offcn.beans.project.Function;
import com.offcn.beans.project.Module;
import com.offcn.dao.daily.MsgMapper;
import com.offcn.service.daily.DailyService;
import com.offcn.service.employee.EmployeeService;
import com.offcn.service.project.ProjectService;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("daily")
public class DailyController {
    @Autowired
    DailyService dailyService;
    @Autowired
    ProjectService projectService;
    @Autowired
    EmployeeService employeeService;
    @Autowired
    MsgMapper mm;

    @RequestMapping("addTask")
    public String addTask(Task task, HttpSession session) {
        Employee employee = (Employee) session.getAttribute("emp");
        task.setEmpFk(employee.getEid());
        task.setStatus(0);
        int i = dailyService.addTask(task);
        return "redirect:../task-add.jsp";
    }

    @RequestMapping("getTaskList")
    public String getTaskList(Model model, @RequestParam(defaultValue = "1") int pageNum,
                              @RequestParam(defaultValue = "0") int cid,
                              @RequestParam(defaultValue = "0") int orderby,
                              String keyword,
                              @RequestParam(defaultValue = "-1") int st,
                              HttpSession session
    ) {
        Employee emp = (Employee) session.getAttribute("emp");
        Map map = new HashMap();
        map.put("cid", cid);
        map.put("keyword", keyword);
        map.put("orderby", orderby);
        map.put("st", st);
        map.put("eid", emp.getEid());
        PageInfo<TaskView> info = dailyService.getTaskPage(pageNum, map);

        model.addAttribute("cid", cid);
        model.addAttribute("keyword", keyword);
        model.addAttribute("orderby", orderby);
        model.addAttribute("st", st);
        model.addAttribute("info", info);

        return "task";
    }

    @RequestMapping("getTaskById")
    public String getTaskById(Model m, int tid) {
        Task task = dailyService.getTaskById(tid);
        m.addAttribute("task", task);
        Function fun = projectService.getFunByFid(task.getFunFk());
        Module mod = projectService.getModByMid(fun.getModeleFk());
        m.addAttribute("mid", mod.getId());//回显四级菜单中的模块时使用
        m.addAttribute("aid", mod.getAnalysisFk());//回显四级菜单中的项目时使用
        return "task-edit";
    }

    @RequestMapping("editTask")
    public String editTask(Task task) {
        dailyService.editTask(task);
        return "redirect:/daily/getTaskList";
    }

    /**
     * 查询出的任务是别人给我下发的任务
     *
     * @param model
     * @param pageNum
     * @param cid
     * @param orderby
     * @param st
     * @param keyword
     * @param session
     * @return
     */
    @RequestMapping("getMyTaskList")
    public String getMyTaskList(Model model, @RequestParam(defaultValue = "1") int pageNum,
                                @RequestParam(defaultValue = "0") int cid,
                                @RequestParam(defaultValue = "0") int orderby,
                                @RequestParam(defaultValue = "0") int st,
                                String keyword, HttpSession session) {
        Employee emp = (Employee) session.getAttribute("emp");
        Map map = new HashMap();
        map.put("cid", cid);
        map.put("keyword", keyword);
        map.put("orderby", orderby);
        map.put("st", st);
        map.put("eid", emp.getEid());
        PageInfo<TaskView> info = dailyService.getMyTaskPage(pageNum, map);
        model.addAttribute("info", info);
        return "task-my";
    }

    /**
     * 更新任务状态，已完成、进行中
     *
     * @param st
     * @param tid
     * @return
     */
    @RequestMapping("updateStatus")
    public String updateStatus(int st, int tid) {
        dailyService.updateStatus(st, tid);
        return "redirect:/daily/getMyTaskList";
    }

    @RequestMapping("getLastNotice")
    @ResponseBody
    public List<Notice> getLastNotice() {
        return dailyService.getLastNotice();
    }

    @RequestMapping("getNoticeByNid")
    @ResponseBody
    public Notice getNoticeByNid(int nid) {
        return dailyService.getNoticeByNid(nid);
    }

    /////////////////////////////////档案////////////////////////////////
    @RequestMapping("getmyarc")
    public String getmyarc(Model m, HttpSession session, @RequestParam(defaultValue = "0") int eid) {
        Employee emp = (Employee) session.getAttribute("emp");
        int flag = 0;
        if (eid == 0) {
            flag = 1;
            eid = emp.getEid();
        }
        Employee arc = employeeService.getArc(eid);
        m.addAttribute("empinfo", arc);
        m.addAttribute("flag", flag);
        return "myarchives";
    }

    @RequestMapping("saveArc")
    public String saveArc(Employee employee, int flag) {
        employeeService.saveOrUpdateArc(employee);
        if (flag == 0) {
            return "redirect:/daily/getarcs";
        } else {
            return "redirect:/daily/getmyarc";
        }
    }

    //获取档案管理列表
    @RequestMapping("getarcs")
    public String getallarc(Model m, @RequestParam(defaultValue = "1") int pageNum) {
        PageInfo<Employee> info = employeeService.getArclist(pageNum);
        m.addAttribute("info", info);
        return "archives";
    }

    /*
 批量导入职工档案
 */
    @RequestMapping("addArchives")
    public String addArchives(MultipartFile files) {
        List<Archives> alist = new ArrayList<>();
        try {
            //创建新excel文档
            HSSFWorkbook hssfWorkbook = new HSSFWorkbook(files.getInputStream());
            //循环工作表
            System.out.println(hssfWorkbook.getNumberOfSheets());
            for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
                //获取指定索引的页
                HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
                if (hssfSheet == null) {
                    continue;
                }
                //循环当前页中的具体行
                for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
                    //根据索引获取具体的行,第一行为表头所以索引从1开始
                    HSSFRow hssfRow = hssfSheet.getRow(rowNum);
                    if (hssfRow != null) {
                        //获取当前行指定索引的列对象
                        HSSFCell bh = hssfRow.getCell(0);
                        HSSFCell gh = hssfRow.getCell(1);
                        HSSFCell byschool = hssfRow.getCell(2);
                        HSSFCell zy = hssfRow.getCell(3);
                        HSSFCell sosper = hssfRow.getCell(4);
                        HSSFCell bydate = hssfRow.getCell(5);
                        HSSFCell zzmm = hssfRow.getCell(6);
                        HSSFCell mz = hssfRow.getCell(7);
                        HSSFCell xl = hssfRow.getCell(8);
                        HSSFCell yx = hssfRow.getCell(9);
                        HSSFCell eid = hssfRow.getCell(10);
                        HSSFCell bir = hssfRow.getCell(11);

                        Archives arc = new Archives();
                        arc.setDnum(bh.getStringCellValue());
                        arc.setLandline(gh.getStringCellValue());
                        arc.setSchool(byschool.getStringCellValue());
                        arc.setZhuanye(zy.getStringCellValue());
                        arc.setSosperson(sosper.getStringCellValue());
                        arc.setBiyedate(bydate.getDateCellValue());
                        arc.setZzmm(zzmm.getStringCellValue());
                        arc.setMinzu(mz.getStringCellValue());
                        arc.setXueli(xl.getStringCellValue());
                        arc.setEmail(yx.getStringCellValue());
                        arc.setEmpFk((int) eid.getNumericCellValue());
                        //arc.setBirthday(bir.getDateCellValue());
                        alist.add(arc);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //将alist集合中的数据批量的插入到数据库中
        int i = employeeService.saveMulti(alist);
        return "redirect:/daily/getarcs";
    }

    /*
  定时保存消息到数据库
 */
    @RequestMapping("saveMsg")
    public String saveMsg(Msg msg, HttpSession session) {
        Employee emp = (Employee) session.getAttribute("emp");
        msg.setSendp(emp.getEid());
        //定义一个调度器
        SchedulerFactory sf = new StdSchedulerFactory();//获取调度器的工厂类对象
        Scheduler scheduler = null;
        try {
            scheduler = sf.getScheduler();//获取的调度器
            //获取任务的描述对象
            JobDetail jd = JobBuilder.newJob(MyJob.class).withIdentity("j1", "g1").build();
            JobDataMap map = jd.getJobDataMap();//用来存放任务需要的变量值
            map.put("msg", msg);
            map.put("mm", mm);

            //获得到简单的触发器
            SimpleTrigger tri = TriggerBuilder.newTrigger().withIdentity("tr1", "g1") //设置触发器的名称以及所属的组
                    .withSchedule(SimpleScheduleBuilder.simpleSchedule())//设置使用的是简单触发器
                    .startAt(msg.getMsgtime()).build();//设置触发的时间规则

            scheduler.scheduleJob(jd, tri);//通过调度器指定通过tri触发器执行jd所描述的任务
            scheduler.start();
        } catch (SchedulerException e) {
            e.printStackTrace();
        }
        return "redirect:../message-give.jsp";
    }

    ///////////////////////////////////////我的报销/////////////////////////////////////////////
    //我的报销 --> 添加报销、编辑报销保存
    @RequestMapping("saveBaoxiao")
    public String saveBaoxiao(Baoxiao bx, HttpSession session,int flag) {
        Employee emp = (Employee) session.getAttribute("emp");
        if(flag==0){
            //编辑我的报销时不用设置id
            bx.setBxid(UUID.randomUUID().toString().substring(16));
        }
        bx.setEmpFk(emp.getEid());
        bx.setBxstatus(0);//待审批状态
        int i = dailyService.saveBaoxiao(bx,flag);
        return "redirect:/daily/getMyBxList";
    }

    //显示报销审批列表
    @RequestMapping("getbxlist")
    public String getbxlist(Model m,@RequestParam(defaultValue = "1") int pageNum,@RequestParam(defaultValue = "0") int flag){
        PageInfo<BaoXiaoView> info = dailyService.getBaoList(pageNum, flag);
        m.addAttribute("info",info);
        return "baoxiao-task";
    }
    //根据报销id获取报销对象
    @RequestMapping("getBxByBxid")
    public String getBxByBxid(Model model,String bxid,@RequestParam(defaultValue = "0") int flag){
        Baoxiao baoxiao = dailyService.getBxByBxid(bxid);
        model.addAttribute("baoxiao", baoxiao);
        if(flag==0){
            //审批编辑页面
            return "baoxiao-task-edit";
        }else {
            //用户自己编辑页面
            return "mybaoxiao-edit";
        }

    }
    //改变报销审批的状态，同意1 驳回2
    @RequestMapping("updateBXstatus")
    public String updateBXstatus(Baoxiao baoxiao){
        dailyService.updateBXstatus(baoxiao);
        if (baoxiao.getBxstatus()==0){
            return "redirect:/daily/getMyBxList";
        }else {
            return "redirect:/daily/getbxlist";
        }
    }

    //获取我的报销列表
    @RequestMapping("getMyBxList")
    public String getMyBxList(HttpSession session,Model model){
        Employee emp = (Employee) session.getAttribute("emp");
        model.addAttribute("bxlist", dailyService.getMyBxList(emp.getEid()));
        return "mybaoxiao-base";
    }

}
