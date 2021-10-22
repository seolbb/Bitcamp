package com.mystudy.jdbc3_prepared;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentManager_Update {

	public static void main(String[] args) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");

			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "mystudy", "mystudypw");

			String sql = "";
			sql += "UPDATE STUDENT ";
			sql += "	SET NAME = ?";
			sql += "		, KOR = ?";
			sql += "		, ENG = ?";
			sql += "		, MATH = ?";
			sql += " WHERE ID = ?";

			pstmt = conn.prepareStatement(sql);

			String id = "2021008";
			String name = "토스트";
			int kor = 99;
			int eng = 88;
			int math = 77;
			pstmt.setString(1, name);
			pstmt.setInt(2, kor);
			pstmt.setInt(3, eng);
			pstmt.setInt(4, math);
			pstmt.setString(5, id);

			int result = pstmt.executeUpdate();
			System.out.println(">> 처리건수 : " + result);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
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
