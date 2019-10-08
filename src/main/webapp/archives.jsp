<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>档案信息管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">
</head>
<body leftmargin="8" topmargin="8" background='${pageContext.request.contextPath}/skin/images/allbg.gif'>

<!--  快速转换位置按钮  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
<tr>
 <td height="26" background="${pageContext.request.contextPath}/skin/images/newlinebg3.gif">
  <table width="58%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td >
    当前位置:项目管理>>档案信息管理
 </td>

 </tr>
</table>
</td>
</tr>
</table>

<!--  搜索表单  -->

<!--  内容列表   -->
<form name="form2" id="tj">

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<input type="hidden" value="1" id="pg" name="pageNum">
	<td height="24" colspan="12" background="${pageContext.request.contextPath}/skin/images/tbg.gif">&nbsp;员工档案信息列表&nbsp;</td>
</tr>
<tr align="center" bgcolor="#FAFAF1" height="22">
	<td width="4%">选择</td>
	<td width="6%">序号</td>
	<td width="6%">姓名</td>
	<td width="6%">年龄</td>
	<td width="10%">毕业院校</td>
	<td width="8%">入职时间</td>
	<td width="8%">联系方式</td>
	<td width="8%">学历</td>
	<td width="10%">邮箱</td>
	<td width="8%">政治面貌</td>
	<td width="8%">民族</td>	
	<td width="10%">操作</td>
</tr>
<c:forEach items="${info.list}" var="arc">
<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
	<td><input name="id" type="checkbox" id="id" value="101" class="np"></td>
	<td>${arc.eid}</td>
	<td align="left"><a href=''><u>${arc.ename}</u></a></td>
	<td>${arc.eage}</td>
	<td>${arc.archives.school}</td>
	<td><fmt:formatDate value="${arc.hiredate}" pattern="yyyy-MM-dd"></fmt:formatDate> </td>
	<td>${arc.archives.landline}</td>
	<td>${arc.archives.xueli}</td>
	<td>${arc.archives.email}</td>
	<td>${arc.archives.zzmm}</td>
	<td>${arc.archives.minzu}</td>
	<td><a href="${pageContext.request.contextPath}/daily/getmyarc">编辑</a> | <a href="project-base-look.jsp">查看详情</a></td>
	<input type="hidden" name="flag" value="0"/>
</tr>
</c:forEach>
	<tr>
		<td colspan="12">
			<%--<div id="pager" style="width:20%;float:right">--%>
			<div id="pager" style="pgwidth:20%;float:right">
			</div>
			<link href="${pageContext.request.contextPath}/static/page/pagination.css" type="text/css"
				  rel="stylesheet"/>
			<script type="text/javascript"
					src="${pageContext.request.contextPath}/static/page/jquery-1.10.2.min.js"></script>
			<script type="text/javascript"
					src="${pageContext.request.contextPath}/static/page/jquery.pagination.js"></script>
			<script type="text/javascript">
				//初始化分页组件
				var count =${info.total};//总页数
				var size =${info.pageSize};//每页的条数
				var pageNO =${info.pageNum};//当前页
				// alert(count+"==="+size+"==="+pageNO);
				$("#pager").pagination(count, {
					items_per_page: size,
					current_page: pageNO - 1,
					next_text: "下一页",
					prev_text: "上一页",
					num_edge_entries: 2,
					load_first_page: false,
					callback: handlePaginationClick
				});

				//点击上一页和下一页回调方法
				function handlePaginationClick(new_page_index, pagination_container) {

					$("#pg").val(new_page_index + 1);
					$("#tj").submit();
				}
			</script>
		</td>
	</tr>
<tr bgcolor="#FAFAF1">
<td height="28" colspan="12">
	&nbsp;
	<a href="" class="coolbg">全选</a>
	<a href="" class="coolbg">反选</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="" class="coolbg">&nbsp;删除&nbsp;</a>
	<a href="" class="coolbg">&nbsp;导出Excel&nbsp;</a>
	<a href="${pageContext.request.contextPath}/archives-add.jsp" class="coolbg">&nbsp;添加档案信息&nbsp;</a>
</td>
</tr>

</table>

</form>
  

</body>
</html>