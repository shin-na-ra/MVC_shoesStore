package com.javalec.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.javalec.dao.AdminDao;

public class SAdminUploadFileCommand implements SCommand {

	DataSource dataSource;
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		AdminDao dao = new AdminDao();
		dao.insertAction(request, response);
		
	}

	
}
