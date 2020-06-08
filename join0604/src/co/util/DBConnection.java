package co.util;

import java.sql.*;

public class DBConnection {
public static Connection getConnection() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//System.out.println("드라이버 검색 성공~");
			
			String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String DB_USER = "student"; // DB의 userid와 pwd를 알맞게 변경
			String DB_PASSWORD = "1234";
		
			try {
				Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
				//System.out.println("conn=>"+conn);
				return conn;
			}catch(SQLException e) {
				System.out.println("db커넥션 실패!");
				e.printStackTrace();
			}
		
		}catch(ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패!");
			e.printStackTrace();
		}
		
		return null;
	}

}
