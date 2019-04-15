<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="conn" class="tree.CtrlSql"></jsp:useBean>
<html>
<head>
<title>树木信息查询</title>
<style type="text/css">
	table,table tr th, table tr td { border:1px solid #8e8e8e; }
	table{
	width:100%;
	font-size:12px;
	color:#333333;
	border-collapse:collapse;
	text-align:left;
	}
	th,td{
	padding:3px;
	border-bottom:1px soild #bbb;
	padding:10px;
	}
	th{
	text-align:left;
	color:#666666;
	
	}
	thead tr{
	font-size:14px;
	height:58px;
	color:#666;
	background-color:#ECECEC;
	border:none;
	}
	</style>
</head>
<body>

<table bgcolor="#ddddff" height="300px" weight="800px" align= "center">
<thead>
<%
String id=request.getParameter("id");
String sql="select * from tree where id='"+id+"'";
conn.conn();
ResultSet rs=conn.query(sql);
rs.next();
 %>
<tr>
<th colspan="9">
<font color="red">编号<%=id %></font>的具体信息如下：
</th></tr></thead>
<tbody>

<tr><th>编号：</th><td><font color="red"><%=rs.getString(1) %></font></td>
<tr><th>名称：</th><td><%=rs.getString(2) %></td></tr>
<tr><th>拉丁文名：</th><td><%=rs.getString(3) %></td></tr>
<tr><th>别称：</th><td><%=rs.getString(4) %></td></tr>
<tr><th>属性：</th><td><%=rs.getString(5) %></td></tr>
<tr><th>树干图:</th>
  <td><img src="<%=request.getContextPath()%><%=rs.getString(6)%>"id="images" height="200" width="120"></td></tr>
<tr><th>叶子图:</th>
  <td><img src="<%=request.getContextPath()%><%=rs.getString(7)%>"id="images" height="200" width="150"></td></tr>
<tr><th>花朵图:</th>
 <td><img src="<%=request.getContextPath()%><%=rs.getString(8)%>"id="images" height="200" width="150"></td></tr>
<tr><th>种子图:</th>
 <td><img src="<%=request.getContextPath()%><%=rs.getString(9)%>"id="images" height="200" width="150"></td></tr>
<tr><th>横截面微观图:</th>
 <td><img src="<%=request.getContextPath()%><%=rs.getString(10)%>"id="images" height="200" width="150"></td></tr>
<tr><th>弦切面微观图:</th>
 <td><img src="<%=request.getContextPath()%><%=rs.getString(11)%>"id="images" height="200" width="150"></td></tr>



</tbody>
</table>
</body>
</html>


