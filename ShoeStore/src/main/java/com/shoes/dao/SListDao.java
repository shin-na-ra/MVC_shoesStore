package com.shoes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.shoes.dto.SListDto;

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
			
			String query = "select brand, name, price, image from product";
			
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String brand = rs.getString("brand");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				byte[] image = rs.getBytes("image");
				
				SListDto dto = new SListDto(brand, name, price, image);
				
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
}
