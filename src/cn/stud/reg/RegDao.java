package cn.stud.reg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import cn.domain.User;

public class RegDao {
	//接收user对象保存到数据库
	public static final String url = "jdbc:mysql://localhost:3306/group5";  
    public static final String name = "com.mysql.jdbc.Driver";  
    public static final String user = "root";  
    public static final String password = "19971017";   

	public void save(User u){
		
		Connection con = null;
		try{
			//1:getconnect
			System.out.println("开始链接数据库");
			Class.forName(name);//指定连接类型  
            con = DriverManager.getConnection(url, user, password);//获取连接  
            System.out.println("链接成功");
			PreparedStatement pst = 
					con.prepareStatement("insert into account (A_name,A_password,A_telphone,A_email,A_sex) values(?,?,?,?,?)");
			pst.setString(1,u.getName());
			pst.setString(2, u.getPwd());
			pst.setString(3,u.getTelephone());
			pst.setString(4, u.getEmail());
			pst.setString(5,u.getSex());
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
