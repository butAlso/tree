<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="conn" class="tree.CtrlSql"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>木材信息修改</title>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
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
	border-bottom:1px solid #bbb;
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
	thead th:hover{background-color:#D4E0F2;}
	.textInput{
	width:150px;
	height:20px;
	border:1px solid #58805f;
	line-height:21px;
	}
	</style>
</head>
<body style="margin-top:0px;">
<form action="../UpdataTree" method="post">
<table border="1" cellspacing="0">
<thead>
<tr>
<th colspan="2">修改木材信息</th>
</tr>
<%
String id=request.getParameter("id");
String sql="select * from tree where id='"+id+"'";
conn.conn();
ResultSet rs=conn.query(sql);
rs.next();
 %>
<tbody>
<tr><th>编号：</th>
<td><input type="text" name="id" readonly="readonly" class="textInput" value="<%=rs.getString(1) %>" />
<font color="red">编号请勿修改</font>
</td></tr>
<tr><th>名称：</th>
<td><input type="text" name="name"  class="textInput" value="<%=rs.getString(2)%>" />
</td></tr>
<tr><th>拉丁文名：</th>
<td><input type="text" name="latin"  class="textInput" value="<%=rs.getString(3) %>" />
</td></tr>
<tr><th>别称：</th>
<td><input type="text" name="another"  class="textInput" value="<%=rs.getString(4) %>" />
</td></tr>
<tr><th>属性：</th>
<td><input type="text" name="classify"  class="textInput" value="<%=rs.getString(5)%>" />
</td></tr>
<tr><th>树干图:</th>
<td><img src="<%=request.getContextPath()%><%=rs.getString(6)%>"id="images1" height="100" width="80">
<input type="file" name="trunk" style="border: 0px; font-size: 10px;"/>
</td></tr>
<tr><th>叶子图:</th>
<td><img src="<%=request.getContextPath()%><%=rs.getString(7)%>"id="images2" height="100" width="80">
<input type="file" name="leaf"style="border: 0px; font-size: 10px;"/>
</td></tr>
<tr><th>花朵图:</th>
<td><img src="<%=request.getContextPath()%><%=rs.getString(8)%>"id="images3" height="100" width="80">
<input type="file" name="flower"style="border: 0px; font-size: 10px;"/>
</td></tr>
<tr><th>种子图:</th>
<td><img src="<%=request.getContextPath()%><%=rs.getString(9)%>"id="images4" height="100" width="80">
<input type="file" name="seed"style="border: 0px; font-size: 10px;"/>
</td></tr>
<tr><th>横截面微观图:</th>
<td><img src="<%=request.getContextPath()%><%=rs.getString(10)%>"id="images5" height="100" width="80">
<input type="file" name="cro"style="border: 0px; font-size: 10px;"/>
</td></tr>
<tr><th>弦切面微观图:</th>
<td><img src="<%=request.getContextPath()%><%=rs.getString(11)%>"id="images6" height="100" width="80">
<input type="file" name="chord"style="border: 0px; font-size: 10px;"/>
</td></tr>
</tbody>
</table>
<input type="submit" name="submit" value="提交" class="submitButton" />
</form>
  </body>
</html>
