package cn.stud.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.upload.UpLoadDao;

import cn.domain.PostBean;
import cn.domain.User;
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//声明
	private LoginService service = new LoginService();
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//1：设置编码的类型
		System.out.println("start");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String method = request.getParameter("method");
		if ("login".equals(method)) {
			login(request, response,out);
		}else if ("update".equals(method)) {
			update(request, response,out);
		}else if ("postList".equals(method)) {
			postList(request, response,out);
		}else if ("getMine".equals(method)) {
			getMine(request, response,out);
		}else if("delPost".equals(method)){
			delPost(request, response,out);
		}
		
	}
	
	
	private void delPost(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
		String id = request.getParameter("id");
		UpLoadDao upLoadDao = new UpLoadDao();
		try {
			upLoadDao.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		User user = (User) request.getSession().getAttribute("user");
		List<PostBean> list = upLoadDao.getMine(user.getId());
		for (PostBean postBean : list) {
			System.err.println(postBean.getPTitle());
		}
		request.setAttribute("postList", list);
		request.getRequestDispatcher("/myPostList.jsp").forward(request, response);
	}

	private void getMine(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
		String tId = request.getParameter("tId");
		UpLoadDao upLoadDao = new UpLoadDao();
		List<PostBean> list = upLoadDao.getMine(tId);
		for (PostBean postBean : list) {
			System.err.println(postBean.getPTitle());
		}
		request.setAttribute("postList", list);
		request.getRequestDispatcher("/myPostList.jsp").forward(request, response);
	}

	
	private void postList(HttpServletRequest request, HttpServletResponse response, PrintWriter out)throws ServletException, IOException {
		String tag = request.getParameter("tag");
		if ("0".equals(tag)) {
			tag = "最新";
		}else if ("1".equals(tag)) {
			tag = "同行";
		}
		else if ("2".equals(tag)) {
			tag = "购物";
		}
		else if ("3".equals(tag)) {
			tag = "二手";
		}
		else if ("4".equals(tag)) {
			tag = "组队";
		}
		System.err.println(tag);
		UpLoadDao upLoadDao = new UpLoadDao();
		List<PostBean> list = upLoadDao.list(tag);
		for (PostBean postBean : list) {
			System.err.println(postBean.getPTitle());
		}
		request.setAttribute("postList", list);
		request.getRequestDispatcher("/postList.jsp").forward(request, response);
		
	}

	/**
	 * 获取个人信息
	 * @param request
	 * @param response
	 */
	private void update(HttpServletRequest request, HttpServletResponse response,PrintWriter out)throws ServletException, IOException {
		//2:接收参数
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd1");
		String sex = request.getParameter("sex");
		String email=request.getParameter("email");
		String telephone=request.getParameter("telephone");
		System.out.println(telephone);
		
//				///调用serive
		User u = new User();
		u.setName(name);
		u.setPwd(pwd);
		u.setSex(sex);
		u.setEmail(email);
		u.setTelephone(telephone);
		u.setId(id);
		service.save(u);
		//在保存完成以后
		response.setContentType("text/html;charset=UTF-8");
		out.print("<script>window.location.href='index.jsp';alert('保存成功，下次登陆更新信息。');</script>");
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * 登录方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void login(HttpServletRequest request,
			HttpServletResponse response,PrintWriter out) throws ServletException, IOException {

		//2:获取参数
		String name = request.getParameter("user");
		String pwd = request.getParameter("password");
		//3:封装到
		User user = new User();
		user.setName(name);
		user.setPwd(pwd);
		//4:调用
		user = service.login(user);
		//判断
		if(user==null){
			//没有登录成功
			//out.println("用户名或是密码错误");
			//out.println("<br>请重新<a href='index.jsp'>登录</a>");
			out.print("<script>window.location.href='index.jsp';alert('用户名或密码错误，请重新登陆。');</script>");
		}else{
			request.getSession().setAttribute("user", user);
			System.err.println(user.getEmail()+":"+user.getTelephone());
			response.sendRedirect("index.jsp");
		}
	}
}
