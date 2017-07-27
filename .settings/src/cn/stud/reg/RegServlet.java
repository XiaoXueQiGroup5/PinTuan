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
		String pwd = request.getParameter("pwd");
		String sex = request.getParameter("sex");
//		///调用serive
		User u = new User();
		u.setName(name);
		u.setPwd(pwd);
		u.setSex(sex);
		service.save(u);
		//在保存完成以后
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = 
				response.getWriter();
		out.print("你好，保存成功了。<a href='"+request.getContextPath()+"/index.html'>登录</a>");
	}
}
