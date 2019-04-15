package tree;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CtrlSql implements Servlet {
	public Connection conn() {
		String DriveName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String URL="jdbc:sqlserver://localhost:1433;databaseName=������ϡľ��ͼ�����ݿ�";
		Connection conn=null;
	try{
		Class.forName(DriveName);
	    conn=DriverManager.getConnection(URL, 
	    "sa", "123");
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}catch(SQLException e){
		e.printStackTrace();
	}
		return conn;
	}
	@Override
	public ResultSet query(String sql) {
		ResultSet rs=null;
		try{
			Statement stmt=this.conn().createStatement();
			rs = stmt.executeQuery(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}

	public void update(String sql) {
		try{
			Statement stmt = this.conn().createStatement();
			stmt.executeUpdate(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	}
	public static void main(String args[]){
		CtrlSql cs=new CtrlSql();
		cs.conn();
	}

}