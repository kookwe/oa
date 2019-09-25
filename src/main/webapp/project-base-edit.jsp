<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>编辑项目信息</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/date/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/date/WdatePicker.js"></script>
	<script type="text/javascript">
        var dateSkin="blue";
        $(document).ready(function(){
            $("#st").focus(function(){
                WdatePicker({skin:dateSkin,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:00'})
            });
            $("#et").focus(function(){
                WdatePicker({skin:dateSkin,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:00'})
            });
            $("#lt").focus(function(){
                WdatePicker({skin:dateSkin,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:00'})
            });

			$.ajax({
				url: "${pageContext.request.contextPath}/pro/getProDet",
				type: "post",
				dataType: "json",
				success: function (data) {
					var clist = data.clist;
					var elist = data.elist;
					$.each(clist, function (i) {
						if(clist[i].id==${project.comname}){
							$("#com").append(
									"<option selected value='" + clist[i].id + "," + clist[i].companyperson + "'>" + clist[i].comname + "</option>"
							)
						}else {
							$("#com").append(
									"<option value='" + clist[i].id + "," + clist[i].companyperson + "'>" + clist[i].comname + "</option>"
							)
						}

					});
					$.each(elist, function (i) {
						if(elist[i].eid==${project.empFk}){
							$("#emp").append(
									"<option selected value='" + elist[i].eid + "'>" + elist[i].ename + "</option>"
							)
						}else {
							$("#emp").append(
									"<option value='" + elist[i].eid + "'>" + elist[i].ename + "</option>"
							)
						}

					});
				}
			})
        });
        function getCname(cnanandid) {
            var idname=cnanandid.split(",");
            $("#cp").val(idname[1]);
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
    当前位置:项目管理>>编辑项目基本信息
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<form name="form2" id="fm2" action="${pageContext.request.contextPath}/pro/savePro" method="post">

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="12" background="skin/images/tbg.gif">&nbsp;编辑项目信息&nbsp;</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">项目名称：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<input value="${project.pname}" name="pname"/></td>
	<td align="right" bgcolor="#FAFAF1" height="22">客户公司名称：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<select id="com" name="mycomname"  onchange="getCname(this.value)">
			<option>选择公司</option>

		</select>
	</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">客户方负责人：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<input value="${project.comper}" name="comper" id="cp"/>
	</td>
	<td align="right" bgcolor="#FAFAF1" height="22">项目经理：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<select id="emp"  name="empFk">
			<option>选择技术负责人</option>

		</select>
	</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">开发人数：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<input value="${project.empcount}" name="empcount">
	</td>
	<td align="right" bgcolor="#FAFAF1" height="22">开始时间：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<input id="st" value="<fmt:formatDate value='${project.starttime}' pattern="yyyy-MM-dd"></fmt:formatDate>" name="starttime"/>
	</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">立项时间：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<input id="lt" value="<fmt:formatDate value='${project.buildtime}' pattern="yyyy-MM-dd"></fmt:formatDate>" name="buildtime"/></td>
	<td align="right" bgcolor="#FAFAF1" height="22">预估成本：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<input value="${project.cost}" name="cost"/>万</td>
</tr>
<tr >
	<td align="right" bgcolor="#FAFAF1" height="22">级别：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<select name="level">
			<option value=1 >紧急</option>
			<option value=2 <c:if test="${project.level==2}">selected</c:if>>一般</option>
			<option value=3 <c:if test="${project.level==3}">selected</c:if>>暂缓</option>
		</select>
	</td>
	<td align="right" bgcolor="#FAFAF1" height="22">计划完成时间：</td>
	<td align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
		<input id="et" value="<fmt:formatDate value='${project.endtime}' pattern="yyyy-MM-dd"></fmt:formatDate>" name="endtime"/></td>
</tr>

<tr >
	<td align="right" bgcolor="#FAFAF1" >备注：</td>
	<td colspan=3 align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
		<textarea rows=15 cols=130 name="remark">${project.remark}</textarea>
	</td>
</tr>


<tr bgcolor="#FAFAF1">
<td height="28" colspan=4 align=center>
	&nbsp;
	<input type="hidden" name="pid" value="${project.pid}">
	<a href="javascript:commit()" class="coolbg">保存</a>
	<a href="project-base.jsp" class="coolbg">返回</a>
</td>
</tr>
</table>
</form>
<script type="text/javascript">
	function commit() {
		$("#fm2").submit();
    }
</script>  

</body>
</html>