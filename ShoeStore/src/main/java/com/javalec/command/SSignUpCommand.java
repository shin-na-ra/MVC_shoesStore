package com.javalec.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.common.utils.parser.FormRequestBodyParser;
import com.javalec.dao.SSignUpDao;
import com.javalec.dto.SSignUpDto;

public class SSignUpCommand implements SCommand {
	
	private final SSignUpDao dao = SSignUpDao.getInstance();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			SSignUpDto dto = FormRequestBodyParser.parseAs(request, SSignUpDto.class)
					.orElseThrow(() -> new RuntimeException(""));
			
			dao.insert(dto);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
