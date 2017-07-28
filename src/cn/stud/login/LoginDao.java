package cn.stud.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.domain.User;
public class LoginDao {
	public static final String url = "jdbc:mysql://localhost:3306/group5";  
    public static final String name = "com.mysql.jdbc.Driver";  
    public static final String user = "root";  
    public static final String password = "19971017";   
	//登录的方法
	public User login(User u){
		//组成sql语句
		String sql = "select * from account where A_name=? and A_password=?";
		Connection con = null;
		try{
			//获取连接对象
			System.out.println("开始链接数据库");
			Class.forName(name);//指定连接类型  
            con = DriverManager.getConnection(url, user, password);//获取连接  
            System.out.println("链接成功");
			//生成sdql执行对象
			PreparedStatement pst = 
					con.prepareStatement(sql);
			pst.setString(1,u.getName());
			pst.setString(2,u.getPwd());
			ResultSet rs =pst.executeQuery();
			//有数据
			if(rs.next()){
				//只设置id
				u.setId(rs.getString("A_id"));
				u.setName(rs.getString("A_name"));
				u.setPwd(rs.getString("A_password"));
				u.setTelephone(rs.getString("A_telphone"));
				u.setEmail(rs.getString("A_email"));
				u.setSex(rs.getString("A_sex"));
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
	public User info(String id) {
		//组成sql语句
				String sql = "select * from account where A_id=?";
				Connection con = null;
				try{
					//获取连接对象
					System.out.println("开始链接数据库");
					Class.forName(name);//指定连接类型  
		            con = DriverManager.getConnection(url, user, password);//获取连接  
		            System.out.println("链接成功");
					//生成sql执行对象
					PreparedStatement pst = 
							con.prepareStatement(sql);
					pst.setString(1,id);
					ResultSet rs =pst.executeQuery();
					//有数据
					if(rs.next()){
						//只设置id
						User u = new User();
						u.setId(rs.getString("A_id"));
						u.setName(rs.getString("A_name"));
						u.setPwd(rs.getString("A_password"));
						u.setTelephone(rs.getString("A_telphone"));
						u.setEmail(rs.getString("A_email"));
						u.setSex(rs.getString("A_sex"));
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
	
public void save(User u){
		
		Connection con = null;
		try{
			//1:getconnect
			System.out.println("开始链接数据库");
			Class.forName(name);//指定连接类型  
            con = DriverManager.getConnection(url, user, password);//获取连接  
            System.out.println("链接成功");
			PreparedStatement pst = 
					con.prepareStatement("update account set A_password=?,A_telphone=?,A_email=?,A_sex=? where A_id=?");
			pst.setString(1, u.getPwd());
			pst.setString(2,u.getTelephone());
			pst.setString(3, u.getEmail());
			pst.setString(4,u.getSex());
			pst.setString(5, u.getId());
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
