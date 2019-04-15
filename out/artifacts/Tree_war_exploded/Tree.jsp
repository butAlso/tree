<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>海南珍稀木材图像数据库</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
  </head> 
 <body>
 <div class="div1">海南珍稀木材图像数据库（管理员页面）</div>
 <div>
 <div class="div2">
 <p style="float:left">
 <script language="JavaScript">
 </script>欢迎您，管理员:<%= session.getAttribute("id")%>！</p>
 <ul id="nav">
 <li><a href="outlogin.jsp">安全退出</a></li>
 <li><a href="addTree.jsp">添加木材信息</a></li>
 <li><a href="Tree.jsp">管理木材信息</a></li>
 <li style="background-color:#a9c741;"><a href="index.jsp">首页</a></li>
 </ul>
 </div>
<div class="div3">
 <h4>木材信息查询</h4>
<form action="./iframe/searchresult.jsp" method="post" target="iframe">
 <p style="font-size:14px;">关键字:</p>
 <input type="text" name="key" style="width:160px;" />
 <br/>
 <p style="font-size:14px;">查询条件：</p>
      <input type="radio" name="condition" value="name">名称
      <input type="radio" name="condition" value="latin">拉丁文名<br/>
      <input type="radio" name="condition" value="another">别称
      <input type="radio" name="condition" value="classfiy">类别
 <input type="submit" value="查询" class="submitButton" />
 </form>
 </div>
 
 <div class="div4">
 <iframe name="iframe" src="iframe/Tree_info.jsp" width="100%" height="100%" style="border:0"></iframe>
 </div>
 </div>
 </body>
</html>

