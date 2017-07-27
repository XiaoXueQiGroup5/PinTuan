package com.upload;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.domain.PostBean;
import cn.domain.User;

public class UpLoadDao {
	//接收user对象保存到数据库
	public static final String url = "jdbc:mysql://localhost:3306/group5";  
    public static final String name = "com.mysql.jdbc.Driver";  
    public static final String user = "root";  
    public static final String password = "19971017";    

    public List<PostBean> list(String tag){
    	List<PostBean> list = new ArrayList<PostBean>();
    	PostBean postBean = null;
    	//1:getconnect
    	Connection con = null;
    	String sql = "";
    	if ("最新".equals(tag)) {
			sql = "select * from post order by P_date desc";
		}else{
			sql = "select * from post where P_tag = ? order by P_date desc";
		}
		System.out.println("开始链接数据库");
		try {
			Class.forName(name);//指定连接类型  
			con = DriverManager.getConnection(url, user, password);//获取连接  
			System.out.println("链接成功");
			PreparedStatement pst = 
					con.prepareStatement(sql);
			if (!"最新".equals(tag)) {
				pst.setString(1, tag);
			}
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				postBean = new PostBean();
				postBean.setAId(rs.getInt("A_id"));
				postBean.setTsId(rs.getInt("Ts_id"));
				postBean.setPTelephone(rs.getString("P_telephone"));
				postBean.setPTag(rs.getString("P_tag"));
				postBean.setPTag2(rs.getString("P_tag2"));
				postBean.setPTitle(rs.getString("P_title"));
				postBean.setPDescription(rs.getString("P_description"));
				postBean.setPDate(rs.getString("P_date"));
				postBean.setPicUrl(rs.getString("Pic_url"));
				list.add(postBean);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return list;
    }
    
    public List<PostBean> getMine(String tId){
    	List<PostBean> list = new ArrayList<PostBean>();
    	PostBean postBean = null;
    	//1:getconnect
    	Connection con = null;
    	String sql = "select * from post where Ts_id = ? order by P_date desc";
		System.out.println("开始链接数据库");
		try {
			Class.forName(name);//指定连接类型  
			con = DriverManager.getConnection(url, user, password);//获取连接  
			System.out.println("链接成功");
			PreparedStatement pst = 
					con.prepareStatement(sql);
				pst.setString(1, tId);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				postBean = new PostBean();
				postBean.setAId(rs.getInt("A_id"));
				postBean.setTsId(rs.getInt("Ts_id"));
				postBean.setPTelephone(rs.getString("P_telephone"));
				postBean.setPTag(rs.getString("P_tag"));
				postBean.setPTag2(rs.getString("P_tag2"));
				postBean.setPTitle(rs.getString("P_title"));
				postBean.setPDescription(rs.getString("P_description"));
				postBean.setPDate(rs.getString("P_date"));
				postBean.setPicUrl(rs.getString("Pic_url"));
				list.add(postBean);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return list;
    }
    
	public void save(PostBean p){
		
		Connection con = null;
		try{
			//1:getconnect
			System.out.println("开始链接数据库");
			Class.forName(name);//指定连接类型  
            con = DriverManager.getConnection(url, user, password);//获取连接  
            System.out.println("链接成功");
			PreparedStatement pst = 
					con.prepareStatement("insert into post (A_id,Ts_id,P_telephone,P_tag,P_tag2,P_title,P_description,P_date,Pic_url) values(?,?,?,?,?,?,?,?,?)");
			pst.setInt(1,p.getAId());
			pst.setInt(2, p.getTsId());
			pst.setString(3,p.getPTelephone());
			pst.setString(4, p.getPTag());
			pst.setString(5, p.getPTag2());
			pst.setString(6, p.getPTitle());
			pst.setString(7,p.getPDescription());
			pst.setString(8, p.getPDate());
			pst.setString(9, p.getPicUrl());
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
	
	
	public int delete(String id)throws Exception{
		Connection con = null;
		System.out.println("开始链接数据库");
		Class.forName(name);//指定连接类型  
        con = DriverManager.getConnection(url, user, password);//获取连接  
        System.out.println("链接成功");
		String sql="delete from post where A_id=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, id);
		return pstmt.executeUpdate();
	}
	
}
