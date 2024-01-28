package com.javalec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.dto.SSignUpDto;

public class SSignUpDao {
	
	public static SSignUpDao getInstance() {
		return SSignUpDaoHolder.INSTNACE;
	}
	
	private final DataSource dataSource;
	
	private SSignUpDao() {
		DataSource dataSource = null;
		
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/semi2jo");	// "java:comp/env" -> context.xml 파일 경로 위치
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		this.dataSource = dataSource;
	}
	
	// DB로 Data 삽입하기.
	public int insert(SSignUpDto dto) {
		String query = """
				INSERT INTO customer (
					id,
					pw,
					name,
					tel,
					address
				)
				VALUES (?,?,?,?,?)
				""";
		
		try (
				Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query);
		) {
			preparedStatement.setString(1, dto.userId());
			preparedStatement.setString(2, dto.password());
			preparedStatement.setString(3, dto.fullName());
			preparedStatement.setString(4, dto.tel());
			preparedStatement.setString(5, dto.address());
			
			return preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	// 싱글톤 패턴
	private static class SSignUpDaoHolder {
		private static final SSignUpDao INSTNACE = new SSignUpDao();
	}
}
