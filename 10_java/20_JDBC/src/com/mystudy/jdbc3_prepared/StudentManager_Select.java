package com.mystudy.jdbc3_prepared;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentManager_Select {

	public static void main(String[] args) {
		//1. JDBC 드라이버 로딩
		//2. DB 연결 - Connection 객체 생성
		//3. Statement 문 실행(SQL 문 실행)
		//4. SQL 실행 결과에 대한 처리
		//5. 클로징 처리에 의한 자원 반납
		Connection conn = null;
		PreparedStatement pstmt = null;;
		ResultSet rs = null;
		
		try {
			//1. JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.OracleDriver");
			//2. DB 연결 - Connection 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "mystudy", "mystudypw");
			//3. PreparedStatement 문 실행(SQL 문 실행)
			String sql = "";
			sql += "SELECT ID, NAME, KOR, ENG, MATH, TOT, AVG ";
			sql += " FROM STUDENT ";
			sql += " WHERE ID = ? ";
			//3-1. Connection 객체로 부터 PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			//3-2. ?(바인드변수) 위치에 값 대입
			String id = "2021008";
			pstmt.setString(1, id);  /*1번째 ? 위치에 String 형태로 id 대입*/
			//3-3. Statement(PreparedStatement) 실행
			rs = pstmt.executeQuery(); /*위에서 prepareStatement로 준비해놨으니까 실행만*/
			
			//4. SQL 실행 결과에 대한 처리
			if (rs.next()) {    
				String str = "";
				str += rs.getString(1) + "\t";  /* 컬럼 위치 번호를 쓸수도 있음*/
				str += rs.getString(2) + "\t";
				str += rs.getInt(3) + "\t";
				str += rs.getInt("ENG") + "\t";
				str += rs.getInt("MATH") + "\t";
				str += rs.getInt("TOT") + "\t";
				str += rs.getDouble("AVG") + "\t";
				
				System.out.println(str);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			//5. 클로징 처리에 의한 자원 반납
			try {
				if(rs != null) rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			try {
				if(pstmt != null) pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			try {
				if(conn != null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}

}
