package com.javalec.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.dto.AdminDto;

public class AdminDao {
	
	DataSource dataSource;
	
	// Constructor
	public AdminDao() {
		try {	
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/mvc");

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// Method
	public ArrayList<AdminDto> loadProducts() {
		ArrayList<AdminDto> dtos = new ArrayList<AdminDto>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String query = "select p.code, p.brand, p.name, p.color, p.price, p.size, p.image, p.qty from product p";
		
		try {
			connection = dataSource.getConnection();

			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				
				int code = resultSet.getInt("p.code");
				String brand = resultSet.getString("p.brand");
				String name = resultSet.getString("p.name");
				String color = resultSet.getString("p.color");
				int price = resultSet.getInt("p.price");
				int size = resultSet.getInt("p.size");
				// image RND 이후 예정
				int qty = resultSet.getInt("p.qty");
				
				AdminDto dto = new AdminDto(code, brand, name, color, price, size, null, qty);
			
				dtos.add(dto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
	} // loadProducts
	
	
	
}