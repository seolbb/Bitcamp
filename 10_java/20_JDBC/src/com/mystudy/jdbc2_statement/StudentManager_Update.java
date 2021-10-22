package com.mystudy.jdbc2_statement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class StudentManager_Update {

	public static void main(String[] args) {

		Connection conn = null;
		Statement stmt = null;
		try {
			// 1. JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.OracleDriver");

			// 2. DB 연결 - Connection 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "mystudy", "mystudypw");

			// 3. Statement 문 실행(SQL 문 실행)
			// 3-1. Connection 객체로부터 Statement 객체 생성
			// 수정 : ID '2021007' 사람의 데이터를 수정 처리
			// 이름: 홍기동, 국어: 99, 영어: 88, 수학:77
			stmt = conn.createStatement();
			String id = "2021007";
			String name = "홍기동";
			int kor = 99;
			int eng = 88;
			int math = 77;

			String sql = "";
			sql += "UPDATE STUDENT ";
			sql += "	SET NAME = '" + name + "' ";
			sql += "	, KOR = " + kor + " ";
			sql += "	, ENG = " + eng + " ";
			sql += "	, MATH = " + math + " ";
			sql += " WHERE ID = '" + id + "' ";
			System.out.println("sql : " + sql);
			
			// 3-2. Statement 객체를 이용해서 SQL문 실행
			int result = stmt.executeUpdate(sql);
			// 4. SQL 실행 결과에 대한 처리
			System.out.println(">> 처리건수 : " + result);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			// 5. 클로징 처리에 의한 자원 반납
			try {
				if (stmt != null)
					stmt.close();
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
