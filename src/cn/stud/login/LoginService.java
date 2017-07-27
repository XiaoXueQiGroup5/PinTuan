package cn.stud.login;

import cn.domain.User;

public class LoginService {
	//声明logindao的实例
	private LoginDao dao = new LoginDao();
	public User login(User u){
		return dao.login(u);
	}
	
	public User info(String id){
		return dao.info(id);
	}

	public void save(User u) {
		dao.save(u);
	}

}
