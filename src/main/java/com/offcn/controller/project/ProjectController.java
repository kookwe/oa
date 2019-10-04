package com.offcn.controller.project;

import com.github.pagehelper.PageInfo;
import com.offcn.beans.customer.Customer;
import com.offcn.beans.employee.Employee;
import com.offcn.beans.project.*;
import com.offcn.dao.project.AnalysisMapper;
import com.offcn.service.customer.CustomerService;
import com.offcn.service.project.ProjectService;
import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.awt.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;
import java.util.List;

import static java.awt.SystemColor.info;

@Controller
@RequestMapping("pro")
public class ProjectController {
    @Autowired
    ProjectService projectService;
    @Autowired
    CustomerService customerService;
    @Autowired
    AnalysisMapper analysisMapper;
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

    @RequestMapping("exportExcel")
    public ResponseEntity<byte[]> expexl() throws Exception {
        List<Project> plist = projectService.getAllpro();
        //创建新excel文档，07版本之前均可以这么写
        HSSFWorkbook workBook = new HSSFWorkbook();
        //新建工作表
        HSSFSheet sheet = workBook.createSheet("第一页");
        //设置单元格的高度
        sheet.setColumnWidth(0, 2500);
        //新建第一行
        HSSFRow row = sheet.createRow(0);
        //第一行中有几个字段
        HSSFCell cell[] = new HSSFCell[4];
        for(int i = 0; i < cell.length; i++){
            //取第一行第一列
            cell[i] = row.createCell(i);
        }
        //给第一行所有列赋值
        cell[0].setCellValue("项目名");
        cell[1].setCellValue("项目客户");
        cell[2].setCellValue("成本");
        cell[3].setCellValue("备注");


        for (int i = 0; i < plist.size(); i++) {
            Project pro = plist.get(i);
            HSSFRow row1 = sheet.createRow(i + 1);
            HSSFCell cell1[] = new HSSFCell[4];
            for(int j = 0; j < cell1.length; j++){
                //取第一行第一列
                cell1[j] = row1.createCell(j);
            }
            cell1[0].setCellValue(pro.getPname());
            cell1[1].setCellValue(pro.getComper());
            cell1[2].setCellValue(pro.getCost());
            cell1[3].setCellValue(pro.getRemark());
        }
        File file = new File("E:\\serverfile\\cus.xls");//先在对应位置创建好空文件
        FileOutputStream fos = new FileOutputStream(file);
        workBook.write(fos);
        fos.close();
        HttpHeaders headers=new HttpHeaders();
        headers.setContentDispositionFormData("attachment","cus.xls");
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.MULTI_STATUS.OK);
    }

    @RequestMapping("deletePro")
    public String deletePro(@RequestParam(name="id") List<Integer> ids){
        projectService.deletePro(ids);
        return "redirect:/pro";
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

    /**
     * 根据传过来的参数不同，进行查询，
     * @param flag 0为查询没有需求的项目，1为有需求的项目，2为查询所有项目
     * @return
     */
    @RequestMapping("getNoNeedPro")
    @ResponseBody
    public List<Project> getProNoNeed(@RequestParam(defaultValue = "0") int flag) {
        List<Project> plist = projectService.getNoNeedPro(flag);

        return plist;
    }

    /**
     * 添加需求和编辑需求中的保存
     * @param analysis
     * @param pidandname
     * @return
     */
    @RequestMapping("saveAna")
    public String saveAna(Analysis analysis,String pidandname){
        //如果pidandname为空则为编辑保存，否则为添加保存
        if(pidandname==null){
            projectService.saveUpAn(analysis);
        }else {
            String[] str = pidandname.split(",");
            analysis.setId(Integer.valueOf(str[0]));
            analysis.setProname(str[1]);
            analysis.setAddtime(new Date()) ;
            analysis.setUpdatetime(new Date());
            projectService.saveAna(analysis);
        }

        return "redirect:/pro/getAlist";
    }

    @RequestMapping("getAnaByPid")
    @ResponseBody
    public Analysis getAnaByPid(int pid){
        Analysis analysis = projectService.getAnaByPid(pid);
        return analysis;
    }
    @RequestMapping("getAnaById")
    public String getAnaById(Model model,int aid,@RequestParam(defaultValue = "0") int flag){

        Analysis analysis = projectService.getAnaById(aid);
        model.addAttribute("analysis", analysis);
        if(flag==1){
            return "project-need-look";
        }
        return "project-need-edit";
    }
    @RequestMapping("deleteNeed")
    public String deleteNeed(@RequestParam(name = "id") List<Integer> ids){
        projectService.deleteNeed(ids);
        return "redirect:/pro/getAlist";
    }

    @RequestMapping("exportAnExcel")
    public ResponseEntity<byte[]> expexlAn() throws Exception {
        List<Analysis> alist = projectService.getAllAn();
        //创建新excel文档，07版本之前均可以这么写
        HSSFWorkbook workBook = new HSSFWorkbook();
        //新建工作表
        HSSFSheet sheet = workBook.createSheet("第一页");
        //设置单元格的高度
        sheet.setColumnWidth(0, 2500);
        //新建第一行
        HSSFRow row = sheet.createRow(0);
        //第一行中有几个字段
        HSSFCell cell[] = new HSSFCell[5];
        for(int i = 0; i < cell.length; i++){
            //取第一行第一列
            cell[i] = row.createCell(i);
        }
        //给第一行所有列赋值
        cell[0].setCellValue("标题");
        cell[1].setCellValue("项目名称");
        cell[2].setCellValue("项目简单描述");
        cell[3].setCellValue("项目详细描述");
        cell[4].setCellValue("备注");


        for (int i = 0; i < alist.size(); i++) {
           Analysis analysis = alist.get(i);
            HSSFRow row1 = sheet.createRow(i + 1);
            HSSFCell cell1[] = new HSSFCell[5];
            for(int j = 0; j < cell1.length; j++){
                //取第一行第一列
                cell1[j] = row1.createCell(j);
            }
            cell1[0].setCellValue(analysis.getTitle());
            cell1[1].setCellValue(analysis.getProname());
            cell1[2].setCellValue(analysis.getSimpledis());
            cell1[3].setCellValue(analysis.getDetaileddis());
            cell1[4].setCellValue(analysis.getRemark());

        }
        File file = new File("E:\\serverfile\\analysis.xls");//先在对应位置创建好空文件
        FileOutputStream fos = new FileOutputStream(file);
        workBook.write(fos);
        fos.close();
        HttpHeaders headers=new HttpHeaders();
        headers.setContentDispositionFormData("attachment","analysis.xls");
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.MULTI_STATUS.OK);
    }
////////////////////////////////////模块管理/////////////////////////////////////////
    @RequestMapping("getModList")
    public String getModList(Model model,
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
        PageInfo<ModuleView> info = projectService.getMoPage(pageNum,map);

        model.addAttribute("cid", cid);
        model.addAttribute("keyword", keyword);
        model.addAttribute("orderby", orderby);
        model.addAttribute("info", info);
        return "project-model";
    }

    /**
     * 模块保存功能
     * @param module
     * @param pidname
     * @return
     */
    @RequestMapping("saveMod")
    public String saveMod(Module module,String pidname){
        String[] str = pidname.split(",");
        module.setProname(str[1]);
        projectService.saveMod(module);
        return "redirect:/pro/getModList";
    }

    @RequestMapping("getModByAid")
    @ResponseBody
    public List<Module> getModByAid(int aid){
        List<Module> mlist = projectService.getModByAid(aid);
        return mlist;
    }
    ////////////////////////////////////////功能管理/////////////////////////////////////////////

    /**
     * 分页显示功能列表及根据条件查询后分页显示列表
     * @param model 传输数据到页面
     * @param pageNum
     * @param cid
     * @param keyword
     * @param orderby
     * @return
     */
    @RequestMapping("getFuncList")
    public String getFuncList(Model model,
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
        PageInfo<FunctionView> info = projectService.getFuncPage(pageNum,map);

        model.addAttribute("cid", cid);
        model.addAttribute("keyword", keyword);
        model.addAttribute("orderby", orderby);
        model.addAttribute("info", info);
        return "project-function";
    }

    @RequestMapping("saveFunction")
    public String saveFunction(Function function,String prname,String ananame){
        function.setProname(prname.split(",")[1]);
        function.setAnalysisname(ananame.split(",")[1]);
        int i = projectService.saveFunction(function);
        return "redirect:/pro/getFuncList";
    }

    @RequestMapping("getFuncByModId")
    @ResponseBody
    public List<Function> getFuncByModId(Integer modid){

        return projectService.getFuncByModId(modid);
    }
    ////////////////////////////////////////附件管理/////////////////////////////////////////////
    @RequestMapping("getAttPage")
    public String getAttPage(Model model,
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
        PageInfo<AttachmentView> info = projectService.getAttPage(pageNum,map);

        model.addAttribute("cid", cid);
        model.addAttribute("keyword", keyword);
        model.addAttribute("orderby", orderby);
        model.addAttribute("info", info);
        return "project-file";
    }

    /**
     * 添加附件后保存附件
     * @param attachment
     * @param files
     * @return
     */
    @RequestMapping("saveAtt")
    public String saveAtt(Attachment attachment,MultipartFile files,@RequestParam(defaultValue = "0") int flag){
        String filename = UUID.randomUUID().toString().substring(24)+ files.getOriginalFilename();
        //先在对应位置创建好文件
        File file = new File("E:\\serverfile\\attachment", filename);
        try {
            files.transferTo(file);
            attachment.setPath(filename);
            attachment.setUploadtime(new Date());
            attachment.setUpdatetime(new Date());
            if (flag==0){
                projectService.saveAtt(attachment);

            }else{
                projectService.updateAtt(attachment);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/pro/getAttPage";
    }

    /**
     * 下载附件
     * @param fname 点击下载时传入
     * @return
     * @throws IOException
     */
    @RequestMapping("downAtt")
    public ResponseEntity<byte[]> downAtt(String fname) throws IOException {
        //得到要下载的文件,需要先创建好这个文件在对应位置
        File f=new File("D:\\attachment\\pro",fname);
        HttpHeaders headers=new HttpHeaders();
        headers.setContentDispositionFormData("attachment",fname);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(f),headers,HttpStatus.OK);
    }

    /**
     * 编辑附件和查看详情共用
     * @param model
     * @param id
     * @param flag 不传值默认跳转到编辑页面
     * @return
     */
    @RequestMapping("getAttById")
    public String getAttById(Model model,int id,Integer flag){
       AttachmentView attachmentView = projectService.getAttById(id);
        model.addAttribute("att",attachmentView);
        if(flag!=null){
            return "project-file-look";
        }
        return "project-file-edit";
    }

    @RequestMapping("deleteAtt")
    public String deleteAtt(@RequestParam(name = "id") List<Integer> ids){
        projectService.deleteAtt(ids);
        return "redirect:/pro/getAttPage";
    }
}
