<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>海南珍稀木材图像数据库</title>
 <link href="css/css.css" rel="stylesheet" type="text/css" />
 <script>
   function chkform(object)  
    {
       if(object.name.value == "")
          { alert("账号不能为空！");
              return false;
           }
         if(object.password.value == "")
          { alert("密码不能为空！");
              return false;
           }else{
           return true;
           }
       }
 </script>
 </head>
 <body>
 <div class="idiv1">
 <form method="post" action="login.jsp" onSubmit="return chkform(this);" >
 <h3>管理员登录</h3>
 <p class="p1">账号：<input type=text name="id" />
 <font color="#FF0000">*</font></p>
 <p class="p1">密码：<input type="password" name="password" />
 <font color="#FF0000">*</font></p>
 <p class="p1"><input type="submit" name="Submit" value="登录" /></p>
 </form>
 <p style="float:right"><a href="user.jsp">游客用户界面</a></p>
 </div>
 </body>
 </html>
