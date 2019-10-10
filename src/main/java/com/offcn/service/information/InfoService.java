package com.offcn.service.information;


import com.github.pagehelper.PageInfo;
import com.offcn.beans.information.Email;
import com.offcn.beans.information.EmailView;
import com.offcn.beans.information.Evaluate;
import com.offcn.beans.information.Forumpost;

import java.util.List;
import java.util.Map;

public interface InfoService {
    int save(Email email);

    PageInfo<EmailView> getByPage(int pageNum, Map map);

    List<Forumpost> getFoms();

    Forumpost getFomByFid(int fid);

    int saveEval(Evaluate eva);

    List<Forumpost> getMyForms(Integer eid);

    int saveForm(Forumpost fom);
}
