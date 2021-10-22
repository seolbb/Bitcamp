package com.mystudy.jdbc_member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mystudy.jdbc_member.common.CommonUtil;
import com.mystudy.jdbc_member.vo.MemberVO;

// SELECT : 테이블 전체 데이터 조회 - selectAll : List<MemberVO>
// SELECT : 하나의 데이터 조회(ID) - selectOne : MemberVO
// SELECT : 하나의 데이터 조회(VO) - selectOne : MemberVO
// SELECT : 로그인(입력값: id, password) - checkIdPassword : boolean
// SELECT : 전체 인원수 확인 - getCountAll() : int

// INSERT : VO 객체를 받아서 입력 - insert : int

// UPDATE : 이름 수정 - updateName(vo) : boolean
// UPDATE : 이름 수정 - updateName(id,name) : boolean
// UPDATE : 패스워드 수정 - updatePassword : boolean
// UPDATE : 전화번호 수정 - updatePhone : boolean
// UPDATE : 주소 수정 - updateAddress : boolean

// DELETE : VO 객체를 받아서 삭제 - delete : int
// DELETE : 키값(ID) 받아서 삭제 - delete : int

public class MemberDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;;
	ResultSet rs = null;

	// SELECT : 테이블 전체 데이터 조회 - selectAll : List<MemberVO>
	public List<MemberVO> selectAll() {
		List<MemberVO> list = null;

		conn = CommonUtil.getConnection();
		if (conn == null)
			return null;

		try {
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT ID, NAME, PASSWORD, PHONE, ADDRESS ");
			sql.append(" FROM MEMBER ");
			sql.append(" ORDER BY ID ");
			pstmt = conn.prepareStatement(sql.toString());

			rs = pstmt.executeQuery();

			list = new ArrayList<MemberVO>();
			while (rs.next()) {
				MemberVO vo = new MemberVO(rs.getString("ID"), rs.getString("NAME"), rs.getString("PASSWORD"),
						rs.getString("PHONE"), rs.getString("ADDRESS"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			CommonUtil.close(conn, pstmt, rs);
		}
		return list;
	}

	// ------------------------------------------------------
	// SELECT : 하나의 데이터 조회(ID) - selectOne : MemberVO
	public MemberVO selectOne(String id) {
		MemberVO vo = null;

		conn = CommonUtil.getConnection();
		if (conn == null)
			return null;

		StringBuilder sql = new StringBuilder();
		sql.append("SELECT ID, NAME, PASSWORD, PHONE, ADDRESS ");
		sql.append(" FROM MEMBER ");
		sql.append(" WHERE ID = ? ");

		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new MemberVO(rs.getString("ID"), rs.getString("NAME"), rs.getString("PASSWORD"),
						rs.getString("PHONE"), rs.getString("ADDRESS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			CommonUtil.close(conn, pstmt, rs);
		}

		return vo;
	}

	// ------------------------------------------------------
	// SELECT : 로그인(입력값: id, password) - checkIdPassword : boolean
	public boolean checkIdPassword(String id, String password) {
		
		conn = CommonUtil.getConnection();
		
		
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT ID, NAME, KOR, ENG, MATH, TOT, AVG ");
			sql.append(" FROM STUDENT ");
			sql.append(" WHERE ID = ? ");
			sql.append(" AND PASSWORD = ? ");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			if (rs.next()) {
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			CommonUtil.close(conn, pstmt);
		}

		return false;
	}
	// ------------------------------------------------------
	// SELECT : 전체 인원수 확인 - getCountAll() : int
	public int getCountAll() {
		int result = 0;

		conn = CommonUtil.getConnection();

//		try {
//			StringBuilder sql = new StringBuilder();
//			sql.append("SELECT COUNT(*) FROM MEMBER ");
//			pstmt = conn.prepareStatement(sql.toString());
//			
//			rs = pstmt.executeQuery();
//			
//			
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			CommonUtil.close(conn, pstmt, rs);
//		}
		
		List<MemberVO> list = null;


		try {
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT ID, NAME, PASSWORD, PHONE, ADDRESS ");
			sql.append(" FROM MEMBER ");
			sql.append(" ORDER BY ID ");
			pstmt = conn.prepareStatement(sql.toString());

			rs = pstmt.executeQuery();

			list = new ArrayList<MemberVO>();
			while (rs.next()) {
				MemberVO vo = new MemberVO(rs.getString("ID"), rs.getString("NAME"), rs.getString("PASSWORD"),
						rs.getString("PHONE"), rs.getString("ADDRESS"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			CommonUtil.close(conn, pstmt, rs);
		}

		return list.size();
	}

	// ------------------------------------------------------
	// INSERT : VO 객체를 받아서 입력 - insert : int
	public int insert(MemberVO vo) {
		int result = 0;

		conn = CommonUtil.getConnection();

		try {
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO MEMBER ");
			sql.append("	(ID, NAME, PASSWORD, PHONE, ADDRESS)");
			sql.append("VALUES (?, ?, ?, ?, ?)");
			pstmt = conn.prepareStatement(sql.toString());
			int idx = 1;
			pstmt.setString(idx++, vo.getId());
			pstmt.setString(idx++, vo.getName());
			pstmt.setString(idx++, vo.getPassword());
			pstmt.setString(idx++, vo.getPhone());
			pstmt.setString(idx++, vo.getAddress());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			CommonUtil.close(conn, pstmt);
		}
		return result;
	}
	// --------------------------------------------------------------
	// UPDATE : 이름 수정 - updateName(id,name) : boolean
	public boolean updateName(String id, String name) {
		
		conn = CommonUtil.getConnection();

		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE MEMBER ");
		sql.append("	SET NAME = ?");
		sql.append("UPDATE MEMBER ");
		
//		conn.prepareStatement(sql.toString());
		
		
		
		return true;
	}
	

}
