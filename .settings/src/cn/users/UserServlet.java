package cn.users;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.domain.User;

/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService service = new UserService();

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<style type='text/css'>" + "table{"
				+ "border:1px solid black;" + "border-collapse:collapse;" + "}"
				+ "td{" + "border:1px solid black;" + "}" + "</style>");
		// 在查询之前先判断这个用户是否登录，就是判断在sesson中是否有usr这样的key
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			// 即用户还没有登录
			out.print("你还没有登录，请先去<a href='"+request.getContextPath()+"/index.html'>登录</a>。");
			
		} else {
			// 直接去调用
			List<User> us = service.query();
			// 遍历显示
			out.print("<table border='0'>"
					+ "<tr><td>编号</td><td>姓名</td><td>密码</td><td>性别</td><td>删除</td></tr>");
			for (User u : us) {
				// 每一个usr都是一行
				String sex = u.getSex().equals("1") ? "男" : "女";
				out.print("<tr><td>" + u.getId() + "</td><td>" + u.getName()
						+ "</td><td>******</td><td>" + sex
						+ "</td><td><a href='"+request.getContextPath()+"/del?id=" + u.getId()
						+ "'>删除</a></td></tr>");
			}
			out.print("</table>");
		}
	}

}
