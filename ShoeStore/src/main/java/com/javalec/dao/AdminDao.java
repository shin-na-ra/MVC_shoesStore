package com.javalec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.dto.AdminDto;
import com.oreilly.servlet.MultipartRequest;

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
	public ArrayList<AdminDto> loadProducts() { // Main Page에서 현재 판매중인 상품을 불러오는 query 
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
	
	public void insertAction(HttpServletRequest request, HttpServletResponse response) { // 사용자가 상품등록 form에 입력한 값 DB에 추가 
		
		String originalFileName = "";
		String type = "";
		
		try {
			// 서버 경로
			String path = request.getServletContext().getRealPath("/file");
			
			// 파일의 최대 크기 지정 , 1KB * 1KB * [option] = [option]MB
			int maxSize = 1024 * 1024 * 1;
			
			// 생성자를 호출 시 파일 업로드를 수행, (request객체, 파일경로, 파일의 최대 용량)
			MultipartRequest multi = new MultipartRequest(request, path, maxSize, "UTF-8");
			
			Enumeration<String> files = multi.getFileNames();
			
			// 넘겨받은 form에서 <file> tag가 있는지를 확인
			if (files.hasMoreElements()) {
				// <file> tag의 name
			    String name = (String) files.nextElement();
			    // 사용자가 업로드한 file의 이름
			    originalFileName = multi.getOriginalFileName(name);
			    
			    System.out.println("Original File Name: " + originalFileName);
			}
			
			String brand = multi.getParameter("brand");
			String kname = multi.getParameter("kname");
			String name = multi.getParameter("name");
			String color = multi.getParameter("color");
			String strPrice = multi.getParameter("price");
			// 숫자의 쉼표 제거
			strPrice = strPrice.replace(",","");
			int price = Integer.parseInt(strPrice);
			
			String strSize = multi.getParameter("size");
			int size = Integer.parseInt(strSize);
			
			String strqty = multi.getParameter("qty");
			int qty = Integer.parseInt(strqty);
			
			String[] descriptions = multi.getParameterValues("description");
			String description = "";
			//  여러 줄로 입력된 상세 설명을 하나의 문자열로 합침
			if (descriptions != null && descriptions.length > 0) {
			    StringBuilder descriptionBuilder = new StringBuilder();

			    for (String line : descriptions) {
			        descriptionBuilder.append(line).append("\n");
			    }

			    description = descriptionBuilder.toString().trim();
			}
			
			String material = multi.getParameter("material");
			String company = multi.getParameter("company");
			String madein = multi.getParameter("madein");
					
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			String query = "insert into product (brand,kbrand,name,kname,color,price,description,metarial,company,madein,image) values (?,?,?,?,?,?,?,?,?,?,?)";
			try {
				connection = dataSource.getConnection();
				
				preparedStatement = connection.prepareStatement(query);
				
				// 브랜드 영문명,한글명
				preparedStatement.setString(1, brand);
				preparedStatement.setString(2, koreanTranslator(brand));
				preparedStatement.setString(3, name);
				preparedStatement.setString(4, kname);
				preparedStatement.setString(5, color);
				preparedStatement.setInt(6, price);
				preparedStatement.setString(7, description);
				preparedStatement.setString(8, material);
				preparedStatement.setString(9, company);
				preparedStatement.setString(10, madein);
				preparedStatement.setString(11, originalFileName);
				
				preparedStatement.executeUpdate();
				
				// 내가 등록한 제품의 제품코드(Primary Key) 확인
				int code = selectCode(name);
				// 등록 시 해당 이름의 사이즈가 이미 있는지 검사
				if(checkAlreadySize(code, size)) {
					// 이미 있다면, 	입력한 사이즈에 수량추가 update
					productSizeUpdate(code, size, qty);
					type = "추가";
				}
				else {
					// 없다면, 새로운 사이즈 및 수량 Insert
					productSizeInsert(code, size, qty);
					type = "신규 등록";
				}
				// 등록한 정보에 따른 log 입력
				registerlog(code, qty, type);
				
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
	
	public int selectCode(String name) { // 사용자가 등록한 상품의 제품 코드(Primary key) 
		
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
	} // selectCode
	
	public void productSizeInsert(int code, int size, int qty) { // 입력한 사이즈 및 수량 index 추가 
		
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
		
	} // productSizeInsert
	
	public String koreanTranslator(String brand) { // 영문명 브랜드를 구하기 위한 Method 
		String value = brand;
		
		if(value.equals("NIKE")) {
			value = "나이키";
		}
		else if(value.equals("NEW BALANCE")) {
			value = "뉴발란스";
		}
		else if(value.equals("ADIDAS")) {
			value = "아디다스";
		}
		else if(value.equals("VANS")) {
			value = "반스";
		}
		
		return value;
	} // koreanTranslator
	
	public boolean checkAlreadySize (int code, int size) { // 등록 시 중복 사이즈 체크 
		boolean result = true;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String query = "select p.code, ps.size, p.qty from product p, product_size ps where p.code=? and ps.size=?";

		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setInt(1, code);
			preparedStatement.setInt(2, size);
			
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				result = true;
			}
			else {
				result = false;
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
		
		return result;
	}
	
	public void productSizeUpdate (int code, int size, int qty) { // 입력한 사이즈에 수량 추가 
		
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			String query = "UPDATE product_size as ps SET ps.qty = ps.qty + ? where p.code=? and ps.size=?";
			try {
				connection = dataSource.getConnection();

				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, qty);
				preparedStatement.setInt(2, code);
				preparedStatement.setInt(3, size) ;
				
				preparedStatement.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				// 메모리 정리를 finally에서 함, 정리는 역순으로
				try {
					if (preparedStatement != null) preparedStatement.close();
					if (connection != null) connection.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
	}
	
	public void registerlog(int code, int qty, String type) { // 제품을 등록했을 때 등록한 log 

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String query = "insert into register (product_code,admin_id,qty,date,type) values (?,admin,?,now(),?)";
		try {
			connection = dataSource.getConnection();

			preparedStatement = connection.prepareStatement(query);

			preparedStatement.setInt(1, code);
			preparedStatement.setInt(2, qty);
			preparedStatement.setString(3, type);
			
			preparedStatement.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 메모리정리
			try {
				if (preparedStatement != null) preparedStatement.close();
				if (connection != null) connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}
	
	public ArrayList<AdminDto> loadRegisterLog() {
		
		ArrayList<AdminDto> dtos = new ArrayList<AdminDto>();
		
		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			
			String query = "select p.name, r.admin_id, r,qty, r.date, r.type "
							   + "from product p, rigster r "
							   + "where r.code = p.code "
							   + "order by r.date DESC LIMIT 5";
			
			try {
				connection = dataSource.getConnection();
				preparedStatement = connection.prepareStatement(query);
				
				resultSet = preparedStatement.executeQuery();
				
				while (resultSet.next()) {
					int code = resultSet.getInt("product_code");
					String adminId = resultSet.getString("admin_id");
					int qty = resultSet.getInt("qty");
					String date = resultSet.getString("date");
					String type = resultSet.getString("type");
					
					AdminDto dto = new AdminDto(code, adminId, qty, date, type);
					
					dtos.add(dto);
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
		return dtos;
	}
	
} // End
