package com.javalec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.dto.SListDto;


public class SListDao {
	
	DataSource dataSource;
	
	public SListDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/semi2jo");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// 로그인시 신발 목록들 보여주기
	public List<SListDto> shoesList() {
		List<SListDto> dtos = new ArrayList<SListDto>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "SELECT MAX(code) as code, name, "
					+ "max(Kname)as Kname, MAX(brand) as brand, max(Kbrand) as Kbrand, "
					+ "MAX(color) as color, MAX(format(price, 0)) as price, "
					+ "MAX(size) as size, MAX(qty) as qty, MAX(image) as image FROM product "
					+ "GROUP BY name";
			
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int code = rs.getInt("code");
				String brand = rs.getString("brand");
				String Kbrand = rs.getString("Kbrand");
				String name = rs.getString("name");
				String Kname = rs.getString("Kname");
				String color = rs.getString("color");
				String price = rs.getString("price");
				int size = rs.getInt("size");
				int qty = rs.getInt("qty");
				String image = rs.getString("image");
				
				SListDto dto = new SListDto(code, brand, Kbrand, name, 
						Kname, color, price, size, qty, image);
				
				
				dtos.add(dto);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (con != null) con.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return dtos;
	}
	
	
	// 제품 클릭 시 구매 창으로 넘어갈 때 가져오는 사진들
	public List<SListDto> imageList(int code) {
		List<SListDto> dtos = new ArrayList<SListDto>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select image from product_image where code = ?";
			
			ps = con.prepareStatement(query);
			ps.setInt(1, code);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String image = rs.getString("image");
				
				SListDto dto = new SListDto(image);
				
				dtos.add(dto);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (con != null) con.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return dtos;
	}
	
	// 제품 이름 찾기 - 클릭 시 title로 사용
	public String titleName(int code) {
		String titleName = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select name from product where code = ?";
			
			ps = con.prepareStatement(query);
			ps.setInt(1, code);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				titleName = rs.getString("name");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (con != null) con.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return titleName;
	}
}
