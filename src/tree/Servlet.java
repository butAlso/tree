package tree;

import java.sql.Connection;
import java.sql.ResultSet;

public interface Servlet{
	public Connection conn();
	public ResultSet query(String sql);
	public void update(String sql);
}

