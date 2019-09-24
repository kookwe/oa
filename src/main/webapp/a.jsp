<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/5
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>
   <table>
       <tr>
           <th></th>
           <th>ID</th>
           <th>name</th>
           <th>cou</th>
           <th>price</th>
       </tr>
       <c:forEach items="${mlist}" var="m" varStatus="s">
       <tr>
           <td>
               <input type="hidden" value="${s.count}" id="${m.pid}">
               <input type="checkbox" value="${m.pid}" class="pid" >
           </td>
           <td>${m.pid}</td>
           <td>${m.pname}</td>
           <td><input id="cou_${s.count}" value="${m.cou}"></td>
           <td><input id="p_${s.count}" value="${m.price}"></td>
       </tr>
       </c:forEach>
   </table>
   <div id="zj">ddddd</div>
</body>
<script type="text/javascript">
    $(".pid").click(function () {
         var pid=$(this).val();
         var h=$("#"+pid).val();
         var p=$("#"+"p_"+h).val();
         var c=$("#"+"cou_"+h).val();
         if(this.checked){

            $("#zj").html(p*c);
         }else{
             $("#zj").html(p*c*-1);
         }
    });
</script>
</html>
