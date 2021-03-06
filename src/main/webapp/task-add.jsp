<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>创建任务</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/date/WdatePicker.js"></script>
    <script type="text/javascript">
        var dateSkin = "blue";
        //加载页面时触发的事件,获取有需求的项目
        $(function () {
            $("#st").focus(function () {
                WdatePicker({skin: dateSkin, readOnly: true, dateFmt: 'yyyy-MM-dd HH:mm:00'})
            });
            $("#et").focus(function () {
                WdatePicker({skin: dateSkin, readOnly: true, dateFmt: 'yyyy-MM-dd HH:mm:00'})
            });
            $.ajax({
                url: 'pro/getNoNeedPro?flag=1',
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    $.each(data, function (index) {
                        $("#pro").append("<option value='" + data[index].pid + "'>" + data[index].pname + "</option>");
                    })
                }
            });

            //加载页面时查找出执行任务的员工列表
            $.ajax({
                url:'emp/getEmps',
                type:'post',
                dataType:'json',
                success:function (data) {
                    $.each(data,function (index) {
                        $("#emp").append("<option value='"+data[index].eid+"'>"+data[index].ename+"</option>");
                    })
                }
            });
        })

        function getAnaByPro(pid) {

            $("#anid").empty();
            //获取项目对应的需求
            $.ajax({
                url: 'pro/getAnaByPid?pid=' + pid,
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    $("#anid").append("<option value='"+ data.title + "'>" + data.title + "</option>");
                    /*根据需求去获取模块*/
                    $("#mod").html("<option value='0'>请选择模块</option>");
                    $.ajax({
                        url: 'pro/getModByAid?aid=' + data.id,
                        type: 'post',
                        dataType: 'json',
                        success: function (data) {
                            $.each(data, function (index) {
                                $("#mod").append("<option value='" + data[index].id + "'>" + data[index].modname + "</option>");
                            })
                        }
                    });
                }
            });
        }
        //根据模块id查到对应的功能，并追加到功能下拉框中
        function getfunc(modid) {
			$("#fun").html("<option value='0'>请选择功能</option>");
			$.ajax({
				url:"pro/getFuncByModId?modid="+modid,
				type:"post",
				dataType:"json",
				success:function (data) {
                    $.each(data,function (index) {
                        $("#fun").append("<option value='"+data[index].id+"'>"+data[index].functionname+"</option>");
                    })
				}
			})
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
                        当前位置:任务管理>>创建任务
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<form name="form2" id="form7" action="${pageContext.request.contextPath}/daily/addTask" method="post">

    <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center"
           style="margin-top:8px">
        <tr bgcolor="#E7E7E7">
            <td height="24" colspan="2" background="${pageContext.request.contextPath}/skin/images/tbg.gif">&nbsp;创建任务&nbsp;</td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">参考位置：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <select id="pro" onchange="getAnaByPro(this.value)">
                    <option value=1>请选择项目</option>
                </select>-
                <select id="anid">
                    <option value=1>请选择需求</option>
                </select>
                -<select id="mod" onchange="getfunc(this.value)">

            </select>-
                <select id="fun" name="funFk">
                    <option value=1>请选择功能</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">任务标题：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input name="tasktitle"/></td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">开始时间：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input id="st" name="starttime"/></td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">结束时间：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input id="et" name="endtime"/></td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">执行者：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <select id="emp" name="empFk2">
                    <option value=1>任务的执行者</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">优先级：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <select name="level">
                    <option value="高">高</option>
                    <option value="中">中</option>
                    <option value="低">低</option>
                </select></td>
        </tr>

        <tr>
            <td align="right" bgcolor="#FAFAF1">详细说明：</td>
            <td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';">
                <textarea rows=10 cols=130 name="remark"></textarea>
            </td>
        </tr>


        <tr bgcolor="#FAFAF1">
            <td height="28" colspan=4 align=center>
                &nbsp;
                <a href="javascript:commit()" class="coolbg">保存</a>
            </td>
        </tr>
    </table>

</form>


</body>
</html>