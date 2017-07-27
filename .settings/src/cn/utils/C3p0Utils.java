package cn.utils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3p0Utils {
	private static DataSource dataSource;
	static {
		// dataSource = new ComboPooledDataSource();
		try {
			ComboPooledDataSource cb = new ComboPooledDataSource();
			cb.setDriverClass("org.h2.Driver");
			cb.setJdbcUrl("jdbc:h2:~/users");
			cb.setUser("sa");
			cb.setPassword("");
			dataSource = cb;
			try {
				// 判断
				Connection con = cb.getConnection();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select count(1)  "
						+ "from INFORMATION_SCHEMA.TABLES  "
						+ "where table_name='USERS' and table_type='TABLE'");
				rs.next();
				int size = rs.getInt(1);
				if(size==0){
					st.execute("create table users(id varchar(32) primary key,name varchar(30),pwd varchar(32),sex char(1))");
				}
				st.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 开发一个工厂方法
	public static DataSource getDataSource() {
		return dataSource;
	}

	// 建议也返回一个connectoiin
	public static Connection getConnection() {
		Connection con = null;
		try {
			con = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
