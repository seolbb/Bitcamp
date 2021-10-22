package com.mystudy.test;

import java.util.List;

import com.mystudy.jdbc_member.dao.MemberDAO;
import com.mystudy.jdbc_member.vo.MemberVO;

public class MemberDAOTest {

	public static void main(String[] args) {
		MemberDAO dao = new MemberDAO();
		List<MemberVO> list = dao.selectAll();
		for(MemberVO mvo : list) {
			System.out.println(mvo);
		}
		
		System.out.println("--- 1개 데이터 조회 ---");
		MemberVO vo = dao.selectOne("HONG3");
		System.out.println(vo);
		
//		System.out.println("--- insert 테스트 ---");
//		MemberVO insertVO = new MemberVO("HONG6", "홍길동6", "6666", "010-6666-6666", "경기도");
//		int result = dao.insert(insertVO);
//		System.out.println(">> 입력건수 : " + result);
		
//		System.out.println("--- 로그인 테스트 ---");
//		boolean login = dao.checkIdPassword("HONG5", "5555");
//		System.out.println(login);
		
		System.out.println("--- 카운트 테스트 ---");
		int cnt = dao.getCountAll();
		System.out.println(cnt);
		
		
		
	}

}
