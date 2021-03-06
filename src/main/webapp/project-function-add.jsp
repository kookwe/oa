<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>添加功能信息</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        //加载页面时触发的事件,获取有需求的项目
        $(function () {
            $.ajax({
                url: 'pro/getNoNeedPro?flag=1',
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    $.each(data, function (index) {
                        $("#pro").append("<option value='" + data[index].pid + "," + data[index].pname + "'>" + data[index].pname + "</option>");
                    })
                }
            });
        })
        function getAnaByPro(pidAndPname) {
            var pidname=pidAndPname.split(",");
            $("#anid").empty();
            //获取项目对应的需求
            $.ajax({
                url:'pro/getAnaByPid?pid='+pidname[0],
                type:'post',
                dataType:'json',
                success:function (data) {
                    $("#anid").append("<option value='"+data.id+","+data.title+"'>"+data.title+"</option>");
                    /*根据需求去获取模块*/
                    $("#mod").empty();
                    $.ajax({
                        url: 'pro/getModByAid?aid='+data.id,
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



        function commit() {
            $("#form5").submit();
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
                        当前位置:项目管理>>添加功能信息
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<form name="form2" action="${pageContext.request.contextPath}/pro/saveFunction" method="post" id="form5">

    <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center"
           style="margin-top:8px">
        <tr bgcolor="#E7E7E7">
            <td height="24" colspan="2" background="${pageContext.request.contextPath}/skin/images/tbg.gif">&nbsp;添加新功能&nbsp;</td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">选择项目：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <select id="pro" name="prname" onchange="getAnaByPro(this.value)">
                    <option value=0>请选择系统</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">选择需求：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <select id="anid" name="ananame">
                    <option value=0>请选择需求</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">选择模块：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <select id="mod" name="modeleFk">
                    <option value=0>请选择模块</option>
                </select>

            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">功能名称：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <input type="text" name="functionname" id="gn" onblur="checkContent(this.value)"/>
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
                    <option value="暂缓">暂缓</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">简单描述：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <textarea rows=10 cols=130 name="simpledis"></textarea></td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FAFAF1" height="22">详细描述：</td>
            <td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
                <textarea rows=15 cols=130 name="detaileddis"></textarea>
            </td>
        </tr>

        <tr>
            <td align="right" bgcolor="#FAFAF1">备注：</td>
            <td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';"
                onMouseOut="javascript:this.bgColor='#FFFFFF';">
                <textarea rows=10 cols=130 name="remark"></textarea>
            </td>
        </tr>


        <tr bgcolor="#FAFAF1">
            <td height="28" colspan=4 align=center>
                &nbsp;
                <a href="javascript:commit()" class="coolbg">保存</a>
                <a href="project-function.jsp" class="coolbg">返回</a>
            </td>
        </tr>
    </table>

</form>


</body>
</html>