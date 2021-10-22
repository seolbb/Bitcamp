package com.mystudy.jdbc3_prepared;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentManager_Insert {

	public static void main(String[] args) {
		// 1. JDBC 드라이버 로딩
		// 2. DB 연결 - Connection 객체 생성
		// 3. PreparedStatement 문 실행(SQL 문 실행)
		// 4. SQL 실행 결과에 대한 처리
		// 5. 클로징 처리에 의한 자원 반납

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			// 1. JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.OracleDriver");
			// 2. DB 연결 - Connection 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "mystudy", "mystudypw");

			// 3. PreparedStatement 문 실행(SQL 문 실행)
			// 3-1. SQL문 실행을 위한 준비 (PrepareStatement 객체 만들기)
			String sql = "";
			sql += "INSERT INTO STUDENT ";
			sql += "	(ID, NAME, KOR, ENG, MATH) ";
			sql += "VALUES (?, ?, ?, ?, ?) ";
			pstmt = conn.prepareStatement(sql);

			// 3-2. SQL 문장의 ? 위치에 값 설정(매칭, 대입)
			String id = "2021008";
			String name = "테스트";
			int kor = 100;
			int eng = 95;
			int math = 88;
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setInt(3, kor);
			pstmt.setInt(4, eng);
			pstmt.setInt(5, math);

			// 3-3. SQL문 실행
			int result = pstmt.executeUpdate();

			// 4. SQL 실행 결과에 대한 처리
			System.out.println(">> 처리건수 : " + result);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			// 5. 클로징 처리에 의한 자원 반납
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

	}

}
