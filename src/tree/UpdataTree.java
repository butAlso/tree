package tree;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UpdataTree extends HttpServlet {
	private static final long serialVersionUID = 1l;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		CtrlSql conn=new CtrlSql();
		String id = request.getParameter("id");
		String name =new String( request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
		String latin =new String( request.getParameter("latin").getBytes("iso-8859-1"),"utf-8");
		String another =new String( request.getParameter("another").getBytes("iso-8859-1"),"utf-8");
		String classify =new String( request.getParameter("classify").getBytes("iso-8859-1"),"utf-8");
		String sql="update tree set id='"+id+"',name='"+name+"',latin ='"+latin+"',another='"
		      +another+"',classify='"+classify+"'where id='"+id+"'";
		conn.conn();
		conn.update(sql);
		response.sendRedirect("./iframe/Tree_info.jsp");
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}

}
