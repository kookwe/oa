package com.offcn.controller.information;

import com.github.pagehelper.PageInfo;
import com.offcn.beans.employee.Employee;
import com.offcn.beans.information.Email;
import com.offcn.beans.information.EmailView;
import com.offcn.beans.information.Evaluate;
import com.offcn.beans.information.Forumpost;
import com.offcn.service.information.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("info")
public class InfoController {
    @Autowired
    InfoService infoService;

    @RequestMapping("sendEmail")
    public String sendEmail(Email email, String recpemail, MultipartFile fj, HttpSession session) throws IOException {
        //将要发送的附件保存到服务器
        String fname = fj.getOriginalFilename();
        File f=new File("E:\\serverfile\\attachment",fname);
        fj.transferTo(f);
        email.setPath(fname);
        Employee emp= (Employee) session.getAttribute("emp");
        email.setEmpFk(emp.getEid());
        email.setSendtime(new Date());

        String path="E:\\serverfile\\attachment\\"+fname;//邮件的绝对路径地址
        //第一步：为第三方邮箱授权
        // 第三方邮箱账号和密码和邮箱的 SMTP 服务器地址
        String myEmailAccount = "zhaojing1144@126.com";
        String myEmailPassword = "qaz123";// 邮箱密码
        String myEmailSMTPHost = "smtp.126.com";

        //创建参数配置, 用于连接邮件服务器的参数配置
        Properties props = new Properties();                    // 参数配置
        props.setProperty("mail.transport.protocol", "smtp");   // 使用的协议（JavaMail规范要求）
        props.setProperty("mail.smtp.host", myEmailSMTPHost);   // 发件人的邮箱的 SMTP 服务器地址
        props.setProperty("mail.smtp.auth", "true");            // 需要请求认证
        // 创建验证器
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                // 密码验证
                return new PasswordAuthentication("zhaojing1144", "qaz1234");// 邮箱的授权码
            }
        };
        Session emailsession = Session.getInstance(props,auth);
        emailsession.setDebug(true);



        //第二步：通过第三方邮箱将邮件发送到对应的收件箱
        try {
            // 3. 创建一封邮件（会话 发件邮箱账号 ，接收邮件的账号）
            MimeMessage message = createMimeMessage(emailsession, myEmailAccount, recpemail,path,email);
            // 4. 根据 Session 获取邮件传输对象
            Transport transport = emailsession.getTransport();
            // 5. 使用 邮箱账号 和 密码 连接邮件服务器, 这里认证的邮箱必须与 message 中的发件人邮箱一致, 否则报错
            transport.connect(myEmailAccount, myEmailPassword);
            // 6. 发送邮件, 发到所有的收件地址, message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人, 抄送人, 密送人
            transport.sendMessage(message, message.getAllRecipients());
            // 7. 关闭连接
            transport.close();

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            //保存到数据库
            infoService.save(email);
        }
        return "redirect:../email.jsp";
    }

    public static MimeMessage createMimeMessage(Session session, String sendMail, String receiveMail,String relpath,Email email) throws Exception {
        // 1. 创建一封邮件
        MimeMessage message = new MimeMessage(session);

        // 2. From: 发件人（昵称有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改昵称）
        message.setFrom(new InternetAddress(sendMail, "发件人", "UTF-8"));

        // 3. To: 收件人（可以增加多个收件人、抄送、密送）
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "接收人", "UTF-8"));
        message.addRecipients(MimeMessage.RecipientType.CC, InternetAddress.parse(sendMail));
        // 4. Subject: 邮件主题（标题有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改标题）
        message.setSubject(email.getTitle(), "UTF-8");


        // 创建消息部分
        BodyPart messageBodyPart = new MimeBodyPart();

        // 消息
        messageBodyPart.setText(email.getContent());

        // 创建多重消息(设置发送附件的对象)
        Multipart multipart = new MimeMultipart();

        // 设置文本消息部分
        multipart.addBodyPart(messageBodyPart);

        // 附件部分
        messageBodyPart = new MimeBodyPart();
        // 设置要发送附件的文件路径
        DataSource source = new FileDataSource(relpath);//设置发送附件的地址
        messageBodyPart.setDataHandler(new DataHandler(source));


        messageBodyPart.setFileName(MimeUtility.encodeText(relpath));//设置发送的附件名
        multipart.addBodyPart(messageBodyPart);

        // 5. Content: 邮件正文（可以使用html标签）（内容有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改发送内容）
        message.setContent(multipart);

        // 6. 设置发件时间
        message.setSentDate(new Date());

        // 7. 保存设置
        message.saveChanges();

        return message;
    }

    @RequestMapping("getEmailList")
    public String getEmailList(Model m,
                               @RequestParam(defaultValue = "1") int pageNum,
                               @RequestParam(defaultValue = "0") int flag,
                               HttpSession session){
        Employee emp=(Employee)session.getAttribute("emp");
        Map map=new HashMap();
        map.put("flag",flag);
        map.put("eid",emp.getEid());
        PageInfo<EmailView> info = infoService.getByPage(pageNum, map);
        m.addAttribute("einfo",info);
        m.addAttribute("flag",flag);//用于在列表页面判断列名应该显示收件人还是发件人
        return "email";
    }
//////////////////////////////////////////主页论坛//////////////////////////////////////////////
    @RequestMapping("getFoms")
    @ResponseBody
    public List<Forumpost> getFoms(){
        return infoService.getFoms();
    }
    //获取单个论坛详情
    @RequestMapping("getFom")
    public String getFom(Model model,int fid){
        Forumpost forumpost = infoService.getFomByFid(fid);
        model.addAttribute("form",forumpost);
        return "forum-reply";
    }
    /*
   保存评论或回复
 */
    @RequestMapping("addEvl")
    public String addEvl(Evaluate eva, HttpSession session){
        Employee emp= (Employee) session.getAttribute("emp");
        eva.setEmpFk4(emp.getEid());
        eva.setUpdatetime(new Date());
        eva.setEvatime(new Date());
        infoService.saveEval(eva);
        return "redirect:/info/getFom?fid="+eva.getForumFk();
    }

    //查询我的帖子
    @RequestMapping("getMyForms")
    public String getMyFoms(Model m,HttpSession session){
        Employee emp= (Employee) session.getAttribute("emp");
        m.addAttribute("flist",infoService.getMyForms(emp.getEid()));
        return "forum-showmyself";
    }

    //保存帖子
    @RequestMapping("addForm")
    public String addFom(Forumpost fom,HttpSession session){
        Employee emp= (Employee) session.getAttribute("emp");
        fom.setEmpFk3(emp.getEid());
        fom.setCreatetime(new Date());
        int i = infoService.saveForm(fom);
        return "redirect:/info/getMyForms";
    }

}
