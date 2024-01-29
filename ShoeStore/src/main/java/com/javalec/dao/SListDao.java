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
	
	
	// Create
	// 구매내역 남기기
	public void okPurchase(String id, int code, int size) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "insert into purchase (customer_id, product_code, date, qty, price, size) "
					+ "values (?, ?, now(), ?, ?, ?)";
			
			ps = con.prepareStatement(query);
			
			ps.setString(1, id);
			ps.setInt(2, code);
			ps.setInt(3, 1);
			ps.setInt(4, getPrice(code));
			ps.setInt(5, size);
			
			ps.executeUpdate();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (ps != null) ps.close();
				if (con != null) con.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public int getPrice(int code) {
		
		int price = 0;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select price from product where code = ?";
			
			ps = con.prepareStatement(query);
			
			ps.setInt(1, code);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				price = rs.getInt("price");
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
		
		return price;
	}
	
	// Read
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
					+ "MAX(qty) as qty, MAX(image) as image "
					+ "FROM product "
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
				int qty = rs.getInt("qty");
				String image = rs.getString("image");
				
				SListDto dto = new SListDto(code, brand, Kbrand, name, 
						Kname, color, price, qty, image);
				
				
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
	
	// 제품을 클릭하면 보여줄 제품 정보들 
	public List<SListDto> shoesInfo(int productCode) {
		List<SListDto> dtos = new ArrayList<SListDto>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "SELECT MAX(code) as code, name, "
					+ "max(Kname)as Kname, MAX(brand) as brand, max(Kbrand) as Kbrand, "
					+ "MAX(color) as color, MAX(format(price, 0)) as price, "
					+ "MAX(qty) as qty, MAX(image) as image, "
					+ "max(description) as description, max(metarial) as metarial, "
					+ "max(company) as company, max(madein) as madein "
					+ "FROM product "
					+ "where code = ? "
					+ "GROUP BY name";
			
			ps = con.prepareStatement(query);
			
			ps.setInt(1, productCode);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int code = rs.getInt("code");
				String brand = rs.getString("brand");
				String Kbrand = rs.getString("Kbrand");
				String name = rs.getString("name");
				String Kname = rs.getString("Kname");
				String color = rs.getString("color");
				String price = rs.getString("price");
				int qty = rs.getInt("qty");
				String description = rs.getString("description");
				String metarial = rs.getString("metarial");
				String company = rs.getString("company");
				String madein = rs.getString("madein");
				
				SListDto dto = new SListDto(code, brand, Kbrand, name, 
						Kname, color, price, qty, description,
						metarial, company, madein);
				
				
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
	
	
	// 제품 검색을 위함
	public List<SListDto> searchShoes(String searchInput) {
		List<SListDto> dtos = new ArrayList<SListDto>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "SELECT MAX(code) as code, name, "
					+ "max(Kname)as Kname, MAX(brand) as brand, max(Kbrand) as Kbrand, "
					+ "MAX(color) as color, MAX(format(price, 0)) as price, "
					+ "MAX(qty) as qty, MAX(image) as image "
					+ "FROM product "
					+ "where brand like '" + searchInput + "%' "
							+ "or Kbrand like '" + searchInput + "%' "
							+ "or name like '" + searchInput + "%' "
					+ "or Kname like '" + searchInput + "%' "
					+ "GROUP BY name";
			
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			System.out.println(searchInput);
			
			while(rs.next()) {
				int code = rs.getInt("code");
				String brand = rs.getString("brand");
				String Kbrand = rs.getString("Kbrand");
				String name = rs.getString("name");
				String Kname = rs.getString("Kname");
				String color = rs.getString("color");
				String price = rs.getString("price");
				int qty = rs.getInt("qty");
				String image = rs.getString("image");
				
				SListDto dto = new SListDto(code, brand, Kbrand, name, 
						Kname, color, price, qty, image);
				
				
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
	
	// 제품별 출고 사이즈가 다르기 때문에 제품별 사이즈를 찾는다.
	public List<SListDto> shoesSize(int code) {
		List<SListDto> dtos = new ArrayList<SListDto>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select size from product_size where product_code = ?";
			
			ps = con.prepareStatement(query);
			ps.setInt(1, code);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int size = rs.getInt("size");
				
				SListDto dto = new SListDto(size);
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
	
	// update
	
	public void updateQty(String id, int code, int hiddenSize) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int purchaseQty = 0;
		int product_sizeQty = 0;
		
		try {
			con = dataSource.getConnection();
			
			try {
				String purchaseQuery = "select sum(qty) from purchase where customer_id = ? and product_code = ?";
				
				ps = con.prepareStatement(purchaseQuery);
				ps.setString(1, id);
				ps.setInt(2, code);
				
				rs = ps.executeQuery();
				
				if (rs.next()) {
					purchaseQty = rs.getInt(1);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			try {
				String product_sizeQuery = "select qty from product_size where product_code = ? and size = ?";
				
				ps = con.prepareStatement(product_sizeQuery);
				
				ps.setInt(1, code);
				ps.setInt(2, hiddenSize);
				
				rs = ps.executeQuery();
				
				if (rs.next()) {
					product_sizeQty = rs.getInt(1);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			
			try {
				String updateQuery = "update product_size set qty = ? where code = ? and size = ?";
				
				ps = con.prepareStatement(updateQuery);
				
				ps.setInt(1, product_sizeQty - purchaseQty);
				ps.setInt(2, code);
				ps.setInt(3, hiddenSize);
				
				ps.executeUpdate();
			}
			catch (Exception e) {
				e.printStackTrace();
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
		
	}
}
