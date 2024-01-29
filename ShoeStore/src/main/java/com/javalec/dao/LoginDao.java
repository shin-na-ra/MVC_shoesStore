package com.javalec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LoginDao {

    DataSource dataSource;

    public LoginDao() {
        try {
            Context context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/semi2jo");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean  validateUser(String id, String password) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;

        try {
        	connection = dataSource.getConnection();
        	
//        	System.out.println(connection);
        	
//            // 디버깅을 위한 출력문 추가
//            System.out.println("ID: " + id);
//            System.out.println("Password: " + password);
        	
            String query = "select * from customer where id=? and pw=?";
            
//            System.out.println(query);
            
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, password);

            rs = preparedStatement.executeQuery();
            
//            while (rs.next()) {
//                // 사용자 정보를 확인하는 출력문 추가
//                System.out.println("DB ID: " + rs.getString("id"));
//                System.out.println("DB Password: " + rs.getString("pw"));
//            }
//            
//            System.out.println("ID Match: " + "admin".equals(id));
//            System.out.println("Password Match: " + "1111".equals(password));
            
            // 결과 집합에 행이 있는지 확인
            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
            // 예외 발생 시 "false" 반환
            return false;
        } finally {
            try {
                if (rs != null) rs.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    
    public boolean  validateAdmin(String id, String password) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;

        try {
        	connection = dataSource.getConnection();
        	
//        	System.out.println(connection);
        	
//            // 디버깅을 위한 출력문 추가
//            System.out.println("ID: " + id);
//            System.out.println("Password: " + password);
        	
            String query = "select * from admin where id=? and pw=?";
            
//            System.out.println(query);
            
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, password);

            rs = preparedStatement.executeQuery();
            
//            while (rs.next()) {
//                // 사용자 정보를 확인하는 출력문 추가
//                System.out.println("DB ID: " + rs.getString("id"));
//                System.out.println("DB Password: " + rs.getString("pw"));
//            }
//            
            System.out.println("ID Match: " + "admin".equals(id));
            System.out.println("Password Match: " + "11111111".equals(password));
            
            // 결과 집합에 행이 있는지 확인
            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
            // 예외 발생 시 "false" 반환
            return false;
        } finally {
            try {
                if (rs != null) rs.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}