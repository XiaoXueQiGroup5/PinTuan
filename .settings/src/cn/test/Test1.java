package cn.test;

import java.net.HttpURLConnection;
import java.net.URL;

import org.junit.Test;

public class Test1 {
	@Test
	public void test1() throws Exception{
		URL url = new URL("http://192.168.1.114:8080/users/demo");
		HttpURLConnection con = 
				(HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("user-agent","iPhone 6 plus");
		con.connect();
		int code = con.getResponseCode();
		System.err.println(code);
	}
}
