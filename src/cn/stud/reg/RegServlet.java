package cn.stud.reg;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.domain.User;

public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
//声明
	private RegService service = new RegService();
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//1:设置编码类型
		request.setCharacterEncoding("UTF-8");
		//2:接收参数
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd1");
		String sex = request.getParameter("sex");
		String email=request.getParameter("email");
		String telephone=request.getParameter("telephone");
		System.out.println(telephone);
		
//		///调用serive
		User u = new User();
		u.setName(name);
		u.setPwd(pwd);
		u.setSex(sex);
		u.setEmail(email);
		u.setTelephone(telephone);
		service.save(u);
		//在保存完成以后
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = 
				response.getWriter();
		//out.println("注册成功。<a href='"+request.getContextPath()+"/index.jsp'>登录</a>");
		out.print("<script>window.location.href='index.jsp';alert('注册成功');</script>");
	}
}
