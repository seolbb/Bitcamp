package com.mystudy.jdbc1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class StudentManager_Insert {

	public static void main(String[] args) {
		
		// 1. JDBC 드라이버 로딩 ( Class.forname())
		try {
			Class.forName("oracle.jdbc.OracleDriver"); // 클래스 이름을 가지고 찾아서 로딩해줌
			System.out.println(">> 드라이버 로딩 성공"); // 찾으면 출력
		} catch (ClassNotFoundException e) {
			System.out.println("[예외발생]>> 드라이버 로딩 실패!!"); // 못찾으면 출력
			e.printStackTrace();
		} 
		
		//2. DB 연결 - Connection 객체 생성 <- DriverManager.getConnection()
		Connection conn = null; // con.close(); 하기 위해서 선언부를 try문 밖으로 빼줌
		try {										// url(거의 정해져있음), username, password
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "mystudy", "mystudypw");
			System.out.println(">> DB연결 성공");
		} catch (SQLException e) {
			System.out.println("[예외] DB 연결 실패!!");
			e.printStackTrace();
		}
		
		//3. Statement 문 실행(SQL 문 실행)
		Statement stmt = null;
		try {
			//Connection 객체로 부터 Statement 객체 생성
			stmt = conn.createStatement();
			String sql = "";
			sql += "INSERT INTO STUDENT ";
			sql += "		(ID, NAME, KOR, ENG, MATH, TOT, AVG) ";
			sql += "VALUES  ('2021004', '김유신2', 100, 90, 80, 0, 0) ";
			
			// SELECT : executeQuery(sql)
			// INSERT, UPDATE, DELETE : executeUpdate(sql)
			int result = stmt.executeUpdate(sql);
			
			//4. SQL 실행 결과에 대한 처리
			System.out.println("처리건수 : " + result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//5. 클로징 처리에 의한 자원 반납	
		if(stmt != null) {
			try {
				stmt.close();
				System.out.println(">> Statement 객체 close");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
				System.out.println(">> Connection 객체 close");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
