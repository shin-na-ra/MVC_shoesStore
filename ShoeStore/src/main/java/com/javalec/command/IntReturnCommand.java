package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IntReturnCommand {

	public int executeInt(HttpServletRequest request, HttpServletResponse response);
	
}
