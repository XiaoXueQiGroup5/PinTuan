package cn.stud.reg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import cn.domain.User;
import cn.utils.C3p0Utils;

public class RegDao {
	//接收user对象保存到数据库
	public void save(User u){
		Connection con = null;
		try{
			//1:getconnect
			con = 
					C3p0Utils.getConnection();
			PreparedStatement pst = 
					con.prepareStatement("insert into users(id,name,pwd,sex) values(?,?,?,?)");
			pst.setString(1, u.getId());
			pst.setString(2,u.getName());
			pst.setString(3, u.getPwd());
			pst.setString(4,u.getSex());
			pst.executeUpdate();
		}catch(Exception e){
			throw new RuntimeException(e);
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
