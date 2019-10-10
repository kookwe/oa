package com.offcn.service.information;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.beans.employee.Employee;
import com.offcn.beans.information.*;
import com.offcn.dao.employee.EmployeeMapper;
import com.offcn.dao.information.EmailMapper;
import com.offcn.dao.information.EvaluateMapper;
import com.offcn.dao.information.ForumpostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class InfoServiceImpl implements InfoService {
    @Autowired
    EmailMapper emailMapper;
    @Autowired
    ForumpostMapper forumpostMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    EvaluateMapper evaluateMapper;

    @Override
    public int save(Email email) {
        return emailMapper.insertSelective(email);
    }

    @Override
    public PageInfo<EmailView> getByPage(int pageNum, Map map) {
        PageHelper.startPage(pageNum, 2);
        List<EmailView> list = emailMapper.getemlist(map);
        PageInfo<EmailView> info = new PageInfo<>(list);
        return info;
    }
/////////////////////////////////////////论坛//////////////////////////////////////////////
    @Override
    public List<Forumpost> getFoms() {
        return forumpostMapper.getFoms();
    }
    /*
      获取某个帖子的基本信息Forumpost---->list<evaluate>---->list<evaluate>
    */
    @Override
    public Forumpost getFomByFid(int fid) {
            //查询帖子的基本信息
            Forumpost fom = forumpostMapper.selectByPrimaryKey(fid);
            //设置帖子的评论人
            Employee emp = employeeMapper.selectByPrimaryKey(fom.getEmpFk3());
            fom.setEmp(emp);
            //设置帖子的评论集合
            EvaluateExample ee=new EvaluateExample();
            EvaluateExample.Criteria cc = ee.createCriteria();
            cc.andForumFkEqualTo(fom.getForumid());
            cc.andEvaidFkIsNull();
            List<Evaluate> firlist = evaluateMapper.selectByExample(ee);
            fom.setElist(firlist);
            //查询评论下的回复
            getReply(firlist);
            return fom;
        }

    @Override
    public int saveEval(Evaluate eva) {
        return evaluateMapper.insertSelective(eva);
    }

    @Override
    public List<Forumpost> getMyForms(Integer eid) {
        ForumpostExample example=new ForumpostExample();
        ForumpostExample.Criteria criteria = example.createCriteria();
        criteria.andEmpFk3EqualTo(eid);
        return forumpostMapper.selectByExample(example);
    }

    @Override
    public int saveForm(Forumpost fom) {

        return forumpostMapper.insertSelective(fom);
    }

    //查看评论下的回复
        public void getReply(List<Evaluate> firlist){
            for(Evaluate eva:firlist){
                //获取设置评论的评论人
                Employee emp = employeeMapper.selectByPrimaryKey(eva.getEmpFk4());
                eva.setEmp(emp);
                //获取设置评论下的回复
                EvaluateExample ee=new EvaluateExample();
                EvaluateExample.Criteria cc = ee.createCriteria();
                cc.andForumFkEqualTo(eva.getForumFk());
                cc.andEvaidFkEqualTo(eva.getEvaid());
                List<Evaluate> seclist = evaluateMapper.selectByExample(ee);
                if(seclist!=null && seclist.size()>0){
                    eva.setElist(seclist);
                    getReply(seclist);
                }
            }
        }

    }
