package com.javalec.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.dto.AdminDto;
import com.mysql.cj.Session;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.Part;

public class AdminDao {
	
	DataSource dataSource;
	
	// Constructor
	public AdminDao() {
		try {	
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/semi2jo");

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
		
		String query = "SELECT p.code, p.brand, p.name, p.color, p.price, p.image, MAX(ps.qty) AS max_qty, MAX(ps.size) AS max_size "
					 + "FROM product p "
					 + "JOIN product_size ps ON p.code = ps.product_code "
					 + "WHERE ps.qty IS NOT NULL "
					 + "GROUP BY p.code, p.brand, p.name, p.color, p.price, p.image;";
		
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
				String image = resultSet.getString("p.image");
				int qty = resultSet.getInt("max_qty");
				int size = resultSet.getInt("max_size");
				
				AdminDto dto = new AdminDto(code, brand, name, color, price, size, qty, image);
			
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
	
	public void insertAction(HttpServletRequest request, HttpServletResponse response) {
		
		String originalFileName = "";
		
		try {
			// 서버 경로
			String path = request.getServletContext().getRealPath("/file");
			// 파일의 최대 크기 지정 , 1KB * 1KB * [option] = [option]MB
			int maxSize = 1024 * 1024 * 1;
			
			
			// 생성자를 호출 시 파일 업로드를 수행, (request객체, 파일경로, 파일의 최대 용량)
			MultipartRequest multi = new MultipartRequest(request, path, maxSize, "UTF-8");
			
			Enumeration<String> files = multi.getFileNames();
			
			if (files.hasMoreElements()) {
				
			    String name = (String) files.nextElement();
			    
			    originalFileName = multi.getOriginalFileName(name);
			    
			    // 여기서 originalFileName을 사용하여 필요한 작업 수행
			    System.out.println("Original File Name: " + originalFileName);
			    System.out.println(name);
			}
			
			String brand = multi.getParameter("brand");
			String name = multi.getParameter("name");
			String color = multi.getParameter("color");
			String strPrice = multi.getParameter("price");
			strPrice = strPrice.replace(",","");
			int price = Integer.parseInt(strPrice);
			String strSize = multi.getParameter("size");
			int size = Integer.parseInt(strSize);
			String strqty = multi.getParameter("qty");
			int qty = Integer.parseInt(strqty);
//			String image = originalFileName;
			String[] descriptions = multi.getParameterValues("description");
			String description = "";
			if (descriptions != null && descriptions.length > 0) {
			    StringBuilder descriptionBuilder = new StringBuilder();

			    for (String line : descriptions) {
			        descriptionBuilder.append(line).append("\n");
			    }

			    description = descriptionBuilder.toString().trim();
			    
			    // description을 사용하여 필요한 작업을 수행
			}
			String material = multi.getParameter("material");
			String company = multi.getParameter("company");
			String madein = multi.getParameter("madein");
					
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
//			String query = "insert into product (brand,kbrand,name,kname,color,price,size,qty,image,description,metarial,company,madein) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			String query = "insert into product (brand,name,color,price,description,metarial,company,madein,image) values (?,?,?,?,?,?,?,?,?)";
			try {
				connection = dataSource.getConnection();
				
				preparedStatement = connection.prepareStatement(query);
				
				preparedStatement.setString(1, brand);
				preparedStatement.setString(2, name);
				preparedStatement.setString(3, color);
				preparedStatement.setInt(4, price);
//				preparedStatement.setInt(5, qty);
				preparedStatement.setString(5, description);
				preparedStatement.setString(6, material);
				preparedStatement.setString(7, company);
				preparedStatement.setString(8, madein);
				System.out.println(originalFileName);
				preparedStatement.setString(9, originalFileName);
				
				preparedStatement.executeUpdate();
				
				int code = selectCode(name);
				productSizeInsert(code, size, qty);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			finally { 
				// 메모리정리
				try {
					if(preparedStatement != null) preparedStatement.close();
					if(connection != null) connection.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int selectCode(String name) {
		
		int code = 0;
		
		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			
			String query = "select p.code from product p where p.name=?";
			
			try {
				connection = dataSource.getConnection();
				
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, name);
				
				resultSet = preparedStatement.executeQuery();
				
				if (resultSet.next()) {
					code = resultSet.getInt("p.code");
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			finally { 
				// 메모리정리
				try {
					if(resultSet != null) resultSet.close();
					if(preparedStatement != null) preparedStatement.close();
					if(connection != null) connection.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return code;
	}
	
	
	public void productSizeInsert(int code, int size, int qty) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String query = "insert into product_size (product_code,size,qty) values (?,?,?)";
		try {
			connection = dataSource.getConnection();
			
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, code);
			preparedStatement.setInt(2, size);
			preparedStatement.setInt(3, qty);
			
			preparedStatement.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally { 
			// 메모리정리
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
	
}