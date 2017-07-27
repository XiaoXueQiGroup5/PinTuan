package cn.stud.reg;

import java.util.UUID;

import cn.domain.User;

public class RegService {
	//声明dao
	private RegDao dao = new RegDao();
	public void save(User u){
		//设置一个id
		dao.save(u);
	}
}
