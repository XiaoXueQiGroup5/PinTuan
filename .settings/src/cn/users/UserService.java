package cn.users;

import cn.domain.User;

import java.util.List;

public class UserService {
	private UserDao dao = new UserDao();

	public List<User> query() {
		return dao.query();
	}
}
