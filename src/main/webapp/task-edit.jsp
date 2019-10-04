<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>编辑任务</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/date/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/date/WdatePicker.js"></script>
    <script type="text/javascript">
        var dateSkin = "blue";
        //加载页面时触发的事件
        $(function () {
            $("#st").focus(function () {
                WdatePicker({skin: dateSkin, readOnly: true, dateFmt: 'yyyy-MM-dd'})
            });
            $("#et").focus(function () {
                WdatePicker({skin: dateSkin, readOnly: true, dateFmt: 'yyyy-MM-dd'})
            });
            //异步请求有需求的项目
            var pid =${aid};//项目的id也是需求的id
            $.ajax({
                url: '${pageContext.request.contextPath}/pro/getNoNeedPro?flag=1',
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    $.each(data, function (index) {
                        if (data[index].pid == pid) {
                            $("#pro").append("<option selected value='" + data[index].pid + "'>" + data[index].pname + "</option>");
                        } else {
                            $("#pro").append("<option value='" + data[index].pid + "'>" + data[index].pname + "</option>");
                        }
                    })
                }
            });
            //异步请求执行任务的员工列表
            var empid =${task.empFk2};
            $.ajax({
                url: '${pageContext.request.contextPath}/emp/getEmps',
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    $.each(data, function (index) {
                        if (data[index].eid == empid) {
                            $("#emp").append("<option selected value='" + data[index].eid + "'>" + data[index].ename + "</option>");
                        } else {
                            $("#emp").append("<option value='" + data[index].eid + "'>" + data[index].ename + "</option>");
                        }
                    })
                }
            });
            getAnaByPro(pid);
        })

        function getAnaByPro(pid) {
            $("#anid").empty();
            var modid =${mid};//要编辑的业务对应的模块的id
            //根据项目获取项目对应的需求
            $.ajax({
                url: '${pageContext.request.contextPath}/pro/getAnaByPid?pid=' + pid,
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    $("#anid").append("<option value='" + data.title + "'>" + data.title + "</option>");
                    //获取需求对应的模块集合
                    $("#mod").html("<option value='0'>请选择模块</option>");
                    $.ajax({
                        url: '${pageContext.request.contextPath}/pro/getModByAid?aid=' + data.id,
                        type: 'post',
                        dataType: 'json',
                        success: function (data) {
                            $.each(data, function (index) {
                                if (data[index].id == modid) {
                                    $("#mod").append("<option selected value='" + data[index].id + "'>" + data[index].modname + "</option>");
                                } else {
                                    $("#mod").append("<option value='" + data[index].id + "'>" + data[index].modname + "</option>");
                                }
                            })
                        }
                    });
                }
            });
            getFun(modid);
        }

        function getFun(modid) {
            $("#fun").html("<option value='0'>请选择功能</option>");
            var funid =${task.funFk};
            $.ajax({
                url: '${pageContext.request.contextPath}/pro/getFuncByModId?mid=' + modid,
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    $.each(data, function (index) {
                        if (funid == data[index].id) {
                            $("#fun").append("<option selected value='" + data[index].id + "'>" + data[index].functionname + "</option>");
                        } else {
                            $("#fun").append("<option value='" + data[index].id + "'>" + data[index].functionname + "</option>");
                        }
                    })
                }
            });
        }

        function commit() {
            $("#form7").submit();
        }
    </script>
</head>
<body leftmargin="8" topmargin="8" background='${pageContext.request.contextPath}/skin/images/allbg.gif'>

<!--  快速转换位置按钮  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
    <tr>
        <td height="26" background="${pageContext.request.contextPath}/skin/images/newlinebg3.gif">
            <table width="58%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        当前位置:任务管理>>编辑任务
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<form name="form2">

    <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center"
           style="margin-top:8px">
        <tr bgcolor="#E7E7E7">
            <td height="24" colspan="2" background="${pageContext.request.contextPath}/skin/images/tbg.gif">&nbsp;编辑任务&nbsp;</td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">参考位置：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <select id="pro" onchange="getAnaByPro(this.value)">
                <option value=0>请选择项目</option>
            </select>
                -<select id="anid">
                <option value=0>请选择需求</option>

            </select>
                -<select id="mod" onchange="getFun(this.value)">
                <option value=0>请选择模块</option>
            </select>
                -<select id="fun">
                <option value=1>请选择功能</option>
            </select>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">任务标题：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input value="${task.tasktitle}"/></td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">开始时间：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <input id="st" value="<fmt:formatDate value="${task.starttime}" pattern="yyyy-MM-dd HH:mm:ss" />"/></td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">结束时间：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <input id="et" value="<fmt:formatDate value="${task.endtime}" pattern="yyyy-MM-dd HH:mm:ss" />"/>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">执行者：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><select>
                <option value=1>张含馨--初级程序员</option>
                <option value=1>张&nbsp;&nbsp;伟--中级程序员</option>
                <option value=1>孙传杰--项目经理</option>
            </select></td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">优先级：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><select>
                <option>高</option>
                <option>中</option>
                <option>低</option>
                <option>暂缓</option>
            </select></td>
        </tr>

        <tr>
            <td align="right" bgcolor="#FAFAF1">详细说明：</td>
            <td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';">
                <textarea rows=10 cols=130>暂无</textarea>
            </td>
        </tr>


        <tr bgcolor="#FAFAF1">
            <td height="28" colspan=4 align=center>
                &nbsp;
                <a href="task.jsp" class="coolbg">保存</a>
            </td>
        </tr>
    </table>

</form>


</body>
</html>