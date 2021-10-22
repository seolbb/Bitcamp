package com.mystudy.jdbc1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//[ JDBC 이용한 DB 연동 프로그래밍 작성 절차 ]
//0. JDBC 라이브러리 개발환경 설정 (빌드 경로에 등록)
//1. JDBC 드라이버 로딩
//2. DB 연결 - Connection 객체 생성 <- DriverManager
//3. Statement 문 실행(SQL 문 실행)
//4. SQL 실행 결과에 대한 처리
//	- SELECT : 조회(검색) 데이터 결과 값에 대한 처리
//	- INSERT, UPDATE, DELETE : int 값(건수) 처리
//5. 클로징 처리에 의한 자원 반납	
//
public class StudentManager_Select {

	public static void main(String[] args) {
		// 0. JDBC 라이브러리 개발환경 설정 (빌드 경로에 등록)
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
		Statement stmt = null; // stmt.close(); 하기 위해서 밖으로 빼줌
		ResultSet rs = null; // rs.close(); 하기위해서 밖으로 빼줌
		try {
			//Connection 객체로 부터 Statement 객체 생성 (.createStatement())
			stmt = conn.createStatement();
			String sql = "" + "SELECT ID, NAME, KOR, ENG, MATH, TOT, AVG " + 
						" FROM STUDENT " + "ORDER BY NAME";
			
			rs = stmt.executeQuery(sql);
			
			//4. SQL 실행 결과에 대한 처리
			//	- SELECT : 조회(검색) 데이터 결과 값에 대한 처리
			System.out.println(">>> SELECT 결과 처리 ---------------------------------");
			while(rs.next()) {    /* rs.next --> 다음 데이터가 있으면 true, 없으면 false */
				String str = "";
				str += rs.getString("ID") + "\t";  /* 컬럼 위치 번호를 쓸수도 있음*/
				str += rs.getString("NAME") + "\t";
				str += rs.getInt("KOR") + "\t";
				str += rs.getInt("ENG") + "\t";
				str += rs.getInt("MATH") + "\t";
				str += rs.getInt("TOT") + "\t";
				str += rs.getDouble("AVG") + "\t";
				
				System.out.println(str);
			}
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		//5. 클로징 처리에 의한 자원 반납
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
