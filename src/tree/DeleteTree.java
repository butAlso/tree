package tree;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteTree extends HttpServlet {
		private static final long serialVersionUID = 1l;
		public void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			response.setContentType("text/html");
			CtrlSql conn=new CtrlSql();
			String id = request.getParameter("id");
			String sql="delete from tree where id='"+id+"'";
			conn.conn();
			conn.update(sql);
			response.sendRedirect("./iframe/Tree_info.jsp");
		}
		public void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			doGet(request,response);
		}

}