<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>编辑模块信息</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">
	<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript">
        //加载页面时触发的事件
        $(function () {
            var pid=${m.analysisFk};//获取后台传到页面的需求的id，也是项目的id
            $.ajax({
                url: '${pageContext.request.contextPath}/pro/getUnAnaPros?flag=1',
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    $.each(data, function (index) {
                        if(data[index].pid==pid){
                            $("#pro").append("<option selected value='" + data[index].pid + "_" + data[index].pname + "'>" + data[index].pname + "</option>");
						}else{
                            $("#pro").append("<option value='" + data[index].pid + "_" + data[index].pname + "'>" + data[index].pname + "</option>");
						}
                    })
                }
            });
            var pidname=pid+"_";
            //alert(pidname);
            getAnaByPro(pidname);
        })

        function getAnaByPro(pidName) {
            $("#anid").empty();
            var pid=pidName.split("_")[0];
            $.ajax({
                url:'${pageContext.request.contextPath}/pro/getAnaByPid',
                type:'post',
                data:{"pid":pid},
                dataType:'json',
                success:function (data) {
                    $("#anid").append("<option value='"+data.id+"'>"+data.title+"</option>");
                }
            });
        }

        function commit() {
			$("#fm2").submit();
        }
	</script>
</head>
<body leftmargin="8" topmargin="8" background='skin/images/allbg.gif'>

<!--  快速转换位置按钮  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
<tr>
 <td height="26" background="skin/images/newlinebg3.gif">
  <table width="58%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td >
    当前位置:项目管理>>编辑模块信息
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<form name="form2" id="fm2" action="${pageContext.request.contextPath}/pro/editsave" method="post">

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="2" background="skin/images/tbg.gif">&nbsp;编辑模块&nbsp;</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">选择项目：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<select id="pro" onchange="getAnaByPro(this.value)" name="proname">
			<option value=0>请选择项目</option>
		</select>
	</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">选择需求：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<select id="anid" name="analysisFk">
			<option value=0>请选择需求</option>
		</select>
	</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">模块名称：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<input value="${m.modname}" name="modname"/></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">优先级：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<select name="level">
			<option value="高" <c:if test="${m.level eq '高'}">selected</c:if>>高</option>
			<option value="中" <c:if test="${m.level eq '中'}">selected</c:if>>中</option>
			<option value="低" <c:if test="${m.level eq '低'}">selected</c:if>>低</option>
			<option value="暂缓" <c:if test="${m.level eq '暂缓'}">selected</c:if>>暂缓</option>
		</select>
	</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">简单描述：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<textarea rows=10 cols=130 name="simpledis">${m.simpledis}</textarea></td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">详细描述：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<textarea rows=15 cols=130 name="detaileddis">${m.detaileddis}</textarea></td>
</tr>

<tr >
	<td align="right" bgcolor="#FAFAF1" >备注：</td>
	<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
		<textarea rows=10 cols=130 name="remark">${m.remark}</textarea>
	</td>
</tr>


<tr bgcolor="#FAFAF1">
<td height="28" colspan=4 align=center>
	&nbsp;
	<input type="hidden" name="id" value="${m.id}">
	<a href="javascript:commit()" class="coolbg">保存</a>
	<a href="project-model.jsp" class="coolbg">返回</a>
</td>
</tr>
</table>
</form>
  

</body>
</html>