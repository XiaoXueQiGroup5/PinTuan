package cn.del;

public class DelService {
	private DelDao dao = new DelDao();
	public int del(String id){
		return dao.del(id);
	}
}
