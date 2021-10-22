package com.mystudy.jdbc2_statement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class StudentManager_Select {

	public static void main(String[] args) {
		//[ JDBC 이용한 DB 연동 프로그래밍 작성 절차 ]
		//0. JDBC 라이브러리 개발환경 설정 (빌드 경로에 등록)
		//1. JDBC 드라이버 로딩
		//2. DB 연결 - Connection 객체 생성 <- DriverManager
		//3. Statement 문 실행(SQL 문 실행)
		//4. SQL 실행 결과에 대한 처리
		//	- SELECT : 조회(검색) 데이터 결과 값에 대한 처리
		//	- INSERT, UPDATE, DELETE : int 값(건수) 처리
		//5. 클로징 처리에 의한 자원 반납	
		Connection conn = null;
		Statement stmt = null;;
		ResultSet rs = null;
		
		try {
			//1. JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.OracleDriver");
			
			//2. DB 연결 - Connection 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "mystudy", "mystudypw");
			
			//3. Statement 문 실행(SQL 문 실행)
			stmt = conn.createStatement();
			
//			String sql = "" + "SELECT ID, NAME, KOR, ENG, MATH, TOT, AVG " + 
//					" FROM STUDENT " + "ORDER BY NAME";  /* 전체 데이터 가져오기*/
			String id = "2021001";
			String sql = "" + "SELECT ID, NAME, KOR, ENG, MATH, TOT, AVG " + 
						" FROM STUDENT " + "WHERE ID = '" + id + "' ";  /* 특정 데이터 가져오기 - 변수 사용할수도 있음*/
			
			rs = stmt.executeQuery(sql);
			
			//4. SQL 실행 결과에 대한 처리
			if (rs.next()) {    /* 특정데이터 확인이니까 if 써도 됨 */
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
			System.out.println(">>> SELECT 작업 정상 처리 완료");
			
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("[예외발생] 드라이브가 없거나 DB 작업 실패!!!!");
			e.printStackTrace();
		} finally {
			//5. 클로징 처리에 의한 자원 반납 (생성 순서와 역순으로)  -- 이런 방법도 있음 : try 먼저하고 null 체크
			try {
				if(rs != null) rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			try {
				if(stmt != null) stmt.close();
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

