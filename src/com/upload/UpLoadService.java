package com.upload;

import java.text.SimpleDateFormat;
import java.util.Date;

import cn.domain.PostBean;

public class UpLoadService {
	private UpLoadDao uld=new UpLoadDao();
	public void save(PostBean bean) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		bean.setPDate(df.format(new Date()));
		uld.save(bean);
	}

}
