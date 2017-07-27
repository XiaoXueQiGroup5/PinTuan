package cn.del;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.domain.User;

public class DelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DelService service = new DelService();

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		//TODO:先判断用户是否已经登录，如果已经登录，就去执行删除工作。
		//如果还没有登录，应该先显示你还没有登录
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			// 即用户还没有登录
			out.print("你还没有登录，请先去<a href='"+request.getContextPath()+"/index.html'>登录</a>。");
			
		} else {
		
		String id = request.getParameter("id");
		service.del(id);
		// 删除完成以后，直接去显示
		response.sendRedirect(request.getContextPath() + "/user");
	}
}
}
