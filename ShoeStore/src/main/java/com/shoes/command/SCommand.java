package com.shoes.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SCommand {

	public void execute(HttpServletRequest reqeust, HttpServletResponse response);
	
}
