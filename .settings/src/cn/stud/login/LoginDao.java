package cn.stud.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.domain.User;
import cn.utils.C3p0Utils;

public class LoginDao {
	//登录的方法
	public User login(User u){
		//组成sql语句
		String sql = "select * from users where name=? and pwd=?";
		Connection con = null;
		try{
			//获取连接对象
			con = C3p0Utils.getConnection();
			//生成sdql执行对象
			PreparedStatement pst = 
					con.prepareStatement(sql);
			pst.setString(1,u.getName());
			pst.setString(2,u.getPwd());
			ResultSet rs =pst.executeQuery();
			//有数据
			if(rs.next()){
				//只设置id
				u.setId(rs.getString("id"));
				return u;
			}else{
				return null;
			}
		}catch(Exception e){
			throw new RuntimeException(e);
		}finally{
			try {
				con.close();//还给连接池
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
