<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>功能管理</title>
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
    当前位置:项目管理>>功能管理
 </td>
  <td>
    <input type='button' class="coolbg np" onClick="location='${pageContext.request.contextPath}/project-function-add.jsp';" value='添加新功能' />
 </td>
 </tr>
</table>
</td>
</tr>
</table>

<!--  搜索表单  -->
<form name='form3' action='${pageContext.request.contextPath}/pro/getFuncList' method='get' id="tj">
<input type='hidden' name='dopost' value='' />
<table width='98%'  border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' align="center" style="margin-top:8px">
  <tr bgcolor='#EEF4EA'>
    <td background='${pageContext.request.contextPath}/skin/images/wbg.gif' align='center'>
      <table border='0' cellpadding='0' cellspacing='0'>
        <tr>
          <td width='90' align='center'>搜索条件：</td>
          <td width='160'>
              <input type="hidden" value="1" id="pg" name="pageNum">
          <select name='cid' style='width:150px'>
          <option value='0' <c:if test="${cid==0}">selected</c:if>>选择类型...</option>
          	<option value='1' <c:if test="${cid==1}">selected</c:if>>项目名称</option>
          	<option value='2' <c:if test="${cid==2}">selected</c:if>>需求名称</option>
          	<option value='3' <c:if test="${cid==3}">selected</c:if>>模块名称</option>
          	<option value='4' <c:if test="${cid==4}">selected</c:if>>功能名称</option>
          </select>
        </td>
        <td width='70'>
          关键字：
        </td>
        <td width='160'>
          	<input type='text' name='keyword' value='${keyword}' style='width:120px' />
        </td>
        <td width='110'>
    		<select name='orderby' style='width:120px'>
            <option value='0' <c:if test="${orderby==0}">selected</c:if>>排序...</option>
            <option value='1' <c:if test="${orderby==1}">selected</c:if>>简单描述</option>
            <option value='2' <c:if test="${orderby==2}">selected</c:if>>详细描述</option>
      	</select>
        </td>
        <td>
          &nbsp;&nbsp;&nbsp;<input name="imageField" type="image" src="${pageContext.request.contextPath}/skin/images/frame/search.gif" width="45" height="20" border="0" class="np" />
        </td>
       </tr>
      </table>
    </td>
  </tr>
</table>
</form>
<!--  内容列表   -->
<form name="form2">

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="12" background="${pageContext.request.contextPath}/skin/images/tbg.gif">&nbsp;功能列表&nbsp;</td>
</tr>
<tr align="center" bgcolor="#FAFAF1" height="22">
	<td width="4%">选择</td>
	<td width="6%">序号</td>
	<td width="10%">功能名称</td>
	<td width="10%">模块名称</td>
	<td width="10%">需求名称</td>
	<td width="10%">项目名称</td>
	<td width="10%">优先级</td>
	<td width="8%">简单描述</td>
	<td width="8%">详细描述</td>
	<td width="10%">操作</td>
</tr>

<c:forEach items="${info.list}" var="func">
<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
	<td><input name="id" type="checkbox" id="id" value="101" class="np"></td>
	<td>1</td>
	<td align="center"><a href=''><u>${func.functionname}</u></a></td>
	<td align="center"><a href=''><u>${func.modname}</u></a></td>
	<td align="center"><a href=''><u>${func.analysisname}</u></a></td>
	<td align="center"><a href=''><u>${func.proname}</u></a></td>
	<td>${func.level}</td>
	<td>${func.simpledis}</td>
	<td>${func.detaileddis}</td>
	<td><a href="project-function-edit.jsp">编辑</a> | <a href="project-function-look.jsp">查看详情</a></td>
</tr>
</c:forEach>
    <tr>
        <td colspan="10">
            <%--<div id="pager" style="width:20%;float:right">--%>
            <div id="pager" style="pgwidth:20%;float:right">
            </div>
            <link href="${pageContext.request.contextPath}/static/page/pagination.css" type="text/css" rel="stylesheet"/>
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
</td>
</tr>
<tr align="right" bgcolor="#EEF4EA">
	<td height="36" colspan="12" align="center"><!--翻页代码 --></td>
</tr>
</table>

</form>
  

</body>
</html>