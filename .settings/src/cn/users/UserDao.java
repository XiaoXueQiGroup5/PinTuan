package cn.users;

import java.security.spec.ECFieldF2m;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.domain.User;
import cn.utils.C3p0Utils;

public class UserDao {
	public List<User> query() {
		List<User> us = new ArrayList<User>();
		Connection con = C3p0Utils.getConnection();
		try {
			//查询所有的用户的信息
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from users");
			while(rs.next()){
				User user = new User();
				user.setId(rs.getString("id"));
				user.setName(rs.getString("name"));
				user.setPwd(rs.getString("pwd"));
				user.setSex(rs.getString("sex"));
				//放到
				us.add(user);
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return us;
	}
}
