package com.mystudy.jdbc_dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// DAO, Dao : Data Access Object / Database Access Object
// 데이터베이스(DB)와 연동해서 CRUD를 구현하는 클래스
public class StudentDAO {
	// 필드에 변수 선언
	private static final String DRIVER = "oracle.jdbc.OracleDriver"; /* 상수 */
	private final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "mystudy";
	private final String PASSWORD = "mystudypw";

	Connection conn = null;
	PreparedStatement pstmt = null;;
	ResultSet rs = null;

	// static 초기화 구문 -- 클래스가 로딩만 되면 실행됨
	static {
		// 1. JDBC 드라이버 로딩
		try {
			Class.forName(DRIVER);
			System.out.println(">> JDBC 드라이버 로딩 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("[예외발생] 드라이버 로딩 실패");
		}
	}

	// SELECT : 테이블 전체 데이터 조회 - selectAll : List<StudentVO>
	// SELECT : 하나의 데이터 조회(ID) - selectOne : StudentVO
	// SELECT : 하나의 데이터 조회(VO) - selectOne : StudentVO
	// INSERT : VO 객체를 받아서 입력 - insert : int
	// UPDATE : VO 객체를 받아서 수정 - update : int
	// DELETE : VO 객체를 받아서 삭제 - delete : int
	// DELETE : 키값(ID) 받아서 삭제 - delete : int

	// SELECT : 테이블 전체 데이터 조회 - selectAll : List<StudentVO>
	public List<StudentVO> selectAll() {
		List<StudentVO> list = null;

		try {
			// 2. DB연결 - Connection 객체 생성 <- DriverManager
			conn = DriverManager.getConnection(URL, USER, PASSWORD);

			// 3. SQL 문 실행
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT ID, NAME, KOR, ENG, MATH, TOT, AVG ");
			sql.append(" FROM STUDENT ");
			sql.append(" ORDER BY ID ");

			pstmt = conn.prepareStatement(sql.toString());

			rs = pstmt.executeQuery();

			// 4. SQL문 실행 결과에 대한 처리
			list = new ArrayList<StudentVO>(); /* list 객체 생성*/
			while (rs.next()) {
				// DB 데이터 하나를 StudentVO 에 저장 + 리스트에 추가  /* StudentVO 타입의 객체 생성*/
				StudentVO vo = new StudentVO(rs.getString("ID"), rs.getString("NAME"), rs.getInt("KOR"),
						rs.getInt("ENG"), rs.getInt("MATH"), rs.getInt("TOT"), rs.getDouble("AVG"));
				// 리스트에 추가
				list.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 5. 사용자원 close
			close(conn, pstmt, rs);
		}
		return list;
	}
	// --------------------------------------------------------------
	// SELECT : 하나의 데이터 조회(ID) - selectOne : StudentVO
	public StudentVO selectOne(String id) {
		StudentVO vo = null;
		// (할일) DB연결하고 SQL문 실행해서 결과값을 vo 변수에 저장하고 리턴
		try {
			// 2. DB연결 - Connection 객체 생성 <- DriverManager
			conn = DriverManager.getConnection(URL, USER, PASSWORD);

			// 3. SQL 문 실행
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT ID, NAME, KOR, ENG, MATH, TOT, AVG ");
			sql.append(" FROM STUDENT ");
			sql.append(" WHERE ID = ? ");

			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			// 4. SQL 실행 결과에 대한 처리
			if (rs.next()) {
				vo = new StudentVO(rs.getString("ID"), rs.getString("NAME"), rs.getInt("KOR"), rs.getInt("ENG"),
						rs.getInt("MATH"), rs.getInt("TOT"), rs.getDouble("AVG"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return vo;
	}
	// --------------------------------------------------------------

	private void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
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
	
	// --------------------------------------------------------------
	// SELECT : 하나의 데이터 조회(VO) - selectOne : StudentVO
	public StudentVO selectOne(StudentVO vo) {
		return selectOne(vo.getId());
	}
	// --------------------------------------------------------------
	// SELECT : 이름으로 데이터 조회(name) - selectList : List<StudentVO>
		/* 개인별로 해보세요 */
	public List<StudentVO> selectList(String name){
		List<StudentVO> listVo = null;
		
		try {
			conn = DriverManager.getConnection(URL,USER,PASSWORD);
			
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT ID, NAME, KOR, ENG, MATH, TOT, AVG ");
			sql.append(" FROM STUDENT ");
			sql.append(" WHERE NAME = ? ");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();

			// 4. SQL 실행 결과에 대한 처리
			listVo = new ArrayList<StudentVO>();
			if(rs.next()) {
				// DB 데이터 하나를 StudentVO 에 저장 + 리스트에 추가
				StudentVO vo = new StudentVO(rs.getString("ID"), rs.getString("NAME"), rs.getInt("KOR"),
						rs.getInt("ENG"), rs.getInt("MATH"), rs.getInt("TOT"), rs.getDouble("AVG"));
				// 리스트에 추가
				listVo.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		return listVo;
	}
	
	
	// --------------------------------------------------------------
	// INSERT : VO 객체를 받아서 입력 - insert : int
	public int insert(StudentVO vo) {
		int result = 0;
		
		try {
			// 2. DB연결 - Connection 객체 생성 <- DriverManager
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			
			// 3. SQL 문 실행
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO STUDENT ");
			sql.append("	   (ID, NAME, KOR, ENG, MATH, TOT, AVG) ");
			sql.append("VALUES (?, ?, ?, ?, ?, ?, ?) ");
			pstmt = conn.prepareStatement(sql.toString());
			
			// ? 값 설정
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getName());
			pstmt.setInt(3, vo.getKor());
			pstmt.setInt(4, vo.getEng());
			pstmt.setInt(5, vo.getMath());
			pstmt.setInt(6, vo.getTot());
			pstmt.setDouble(7, vo.getAvg());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt);
		}
		return result;
	}
	// --------------------------------------------------------------
	private void close(Connection conn, PreparedStatement pstmt) {
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
	// --------------------------------------------------------------
	// UPDATE : VO 객체를 받아서 수정 - update : int
	// (실습) 국어, 영어, 수학, 총점, 평균 수정 처리
	public int update (StudentVO vo) {
		int result = 0;

		try {
			// 2. DB연결 - Connection 객체 생성 <- DriverManager
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			
			// 3. SQL 문 실행
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE STUDENT ");
			sql.append("	SET KOR = ?");
			sql.append("		, ENG = ?");
			sql.append("		, MATH = ?");
			sql.append("		, TOT = ?");
			sql.append("		, AVG = ?");
			sql.append("WHERE ID = ?");
			pstmt = conn.prepareStatement(sql.toString());
			
			// ? 값 설정
			int idx = 1; /* 변수 설정*/
			pstmt.setInt(idx++, vo.getKor());
			pstmt.setInt(idx++, vo.getEng());
			pstmt.setInt(idx++, vo.getMath());
			pstmt.setInt(idx++, vo.getTot());
			pstmt.setDouble(idx++, vo.getAvg());
			pstmt.setString(idx++, vo.getId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt);
		}
		return result;
	}
	// --------------------------------------------------------------
	// UPDATE : 이름수정(id, name) - update : int
			/* 개인별로 실습*/
	public int updateStu(StudentVO vo) {
		int result = 0;
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			
			
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE STUDENT ");
			sql.append("	SET NAME = ? ");
			sql.append("WHERE ID = ? ");
			
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt);
		}
		return result;
	}
	
	// --------------------------------------------------------------
	// DELETE : VO 객체를 받아서 삭제 - delete : int
	public int delete(StudentVO vo) {
		int result = 0;
		// 2. DB연결 - Connection 객체 생성 <- DriverManager
			try {
				conn = DriverManager.getConnection(URL, USER, PASSWORD);
				
				StringBuilder sql = new StringBuilder();
				sql.append("DELETE FROM STUDENT WHERE ID = ? ");
				pstmt = conn.prepareStatement(sql.toString());
				
				pstmt.setString(1, vo.getId());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(conn,pstmt);
			}
		return result;
	}

	// --------------------------------------------------------------

	// DELETE : 키값(ID) 받아서 삭제 - delete : int
	// (실습)
	public int delete(String id) {
		int result = 0;
		// 2. DB연결 - Connection 객체 생성 <- DriverManager
		try {
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			
			// 3. SQL 문 실행
			StringBuilder sql = new StringBuilder();
			sql.append("DELETE FROM STUDENT WHERE ID = ? ");
			pstmt = conn.prepareStatement(sql.toString());
			
			// ? 값 설정
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt);
		}
		return result;
	}
	
	

}
