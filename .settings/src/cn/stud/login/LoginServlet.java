package cn.stud.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.domain.User;
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//声明
	private LoginService service = new LoginService();
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//1：设置编码的类型
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		//2:获取参数
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		//3:封装到
		User user = new User();
		user.setName(name);
		user.setPwd(pwd);
		//4:调用
		user = service.login(user);
		//判断
		if(user==null){
			//没有登录成功
			out.println("用户名或是密码错误");
			out.println("<br>请重新<a href='index.html'>登录</a>");
		}else{
			out.println("你登录成功了:"+user.getName());
			//登录成功以后，就直将这个用户的信息放到sesssion
			HttpSession s  = 
					request.getSession();
			s.setAttribute("user",user);

			out.println("查看<a href='user'>所有用户</a>");
		}
	}

}
