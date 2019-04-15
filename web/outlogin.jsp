<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<script>
if(confirm("确定要退出系统吗？")){
window.parent.close();
window.location.href="<%=request.getContextPath()%>/user.jsp";//退出当前登录，跳转到登录界面
}else{
history.go(-1);
}
</script>
<body><%session.invalidate(); %></body>
</html>