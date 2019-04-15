<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="conn" class="tree.CtrlSql"></jsp:useBean>
<html>
<head><title>木材信息管理</title>
<style type="text/css">
table,table tr th, table tr td { border:1px solid #8e8e8e; }
</style>
</head>
<body style="margin-top:0px;">
<table bgcolor="#ddddff" height="300px" weight="800px" align= "center">
<thead align= "center">
<tr bgcolor="#f0f0f0">
<th width="15px">编号 </th>
<th width="20px">名称</th>
<th width="30px">拉丁文名 </th>
<th width="20px">别称</th>
<th width="20px">属性 </th>
<th width="50px">树干图 </th>
<th width="50px">叶子图 </th>
<th width="50px">花朵图 </th>
<th width="50px">种子图 </th>
<th width="50px">横截面微观图 </th>
<th width="50px">弦切面微观图 </th>

</tr>
</thead>
<tbody>
<% 
 conn.conn();
 String sql="select * from tree";
 ResultSet rs=conn.query(sql);
 while (rs.next()){
%>
<tr>
 <td><font color="red"><%=rs.getString(1) %></font></td>
 <td><%=rs.getString(2) %></td>
 <td><%=rs.getString(3) %></td>
 <td><%=rs.getString(4) %></td>
 <td><%=rs.getString(5) %></td>
 <td><img src="<%=request.getContextPath()%><%=rs.getString(6)%>"id="images" height="100" width="80"></td>
 <td><img src="<%=request.getContextPath()%><%=rs.getString(7)%>"id="images" height="100" width="80"></td>
 <td><img src="<%=request.getContextPath()%><%=rs.getString(8)%>"id="images" height="100" width="80"></td>
 <td><img src="<%=request.getContextPath()%><%=rs.getString(9)%>"id="images" height="100" width="80"></td>
 <td><img src="<%=request.getContextPath()%><%=rs.getString(10)%>"id="images" height="100" width="80"></td>
 <td><img src="<%=request.getContextPath()%><%=rs.getString(11)%>"id="images" height="100" width="80"></td>
 <td align= "center"><a href=updataTree_info.jsp?id=<%=rs.getString(1) %>>修改</a></td>
 <td align= "center"><a href=../DeleteTree?id=<%=rs.getString(1) %>>删除</a></td>
</tr>
<%
}
%>
</tbody>
</table>
</body>
</html>