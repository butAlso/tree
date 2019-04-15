<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
 <head>
 <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <title>海南珍稀木材图像数据库</title>
 </head>
 <body>
 <%
 String getId=request.getParameter("id");
 String getPassword=request.getParameter("password");
 if(getId!=null&&!getId.equals("")){
 try{
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
  Connection conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=海南珍稀木材图像数据库", 
    "sa", "123");
  Statement stmt=conn.createStatement();
  String sql="select * from admin where id='"+getId+"'and password='"+getPassword+"'";
  ResultSet rs=stmt.executeQuery(sql);
    if(rs.next()){
    session.setAttribute("login","ok");
    session.setAttribute("id",getId);
   %>
   <jsp:forward page = "index.jsp"/>
   <%
   }else
     %>
   <jsp:forward page = "mistake.jsp"/>
   <%
   }catch(Exception e){
    e.printStackTrace();
   }
   }else{
     }
    %>
 </body>
</html>