package cn.del;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import cn.utils.C3p0Utils;

public class DelDao {
	public int del(String id){
		int a = 0;
		Connection con = C3p0Utils.getConnection();
		try{
			PreparedStatement pst = 
					con.prepareStatement("delete from users where id=?");
			pst.setString(1,id);
			a = pst.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return a;
	}
}
