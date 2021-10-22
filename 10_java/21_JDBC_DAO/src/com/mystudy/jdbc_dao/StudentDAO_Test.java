package com.mystudy.jdbc_dao;

import java.util.List;

public class StudentDAO_Test {

	public static void main(String[] args) {
		StudentDAO dao = new StudentDAO();
		List<StudentVO> list = dao.selectAll();
		for(StudentVO svo : list) {
			System.out.println(svo);
		}
		
		System.out.println("--셀렉트리스트--");
		List<StudentVO> list2 = dao.selectList("테스트11");
		System.out.println(list2);

		
		System.out.println("---- 1개 데이터 조회(ID) ----");
		StudentVO vo = dao.selectOne("2021001");
		System.out.println(vo);
		System.out.println("-------------");
		
		
		StudentVO vo1 = new StudentVO("2021001", "test", 0, 0, 0);
		vo = dao.selectOne(vo1);
		System.out.println(vo);
		
//		System.out.println("---- 입력(INSERT) ----");
		StudentVO insertVO = new StudentVO("2021011", "테스트11", 100, 90, 81);
//		int result = dao.insert(insertVO);
//		System.out.println(">> 입력 건수 : " + result);
//		
//		System.out.println("--- 입력데이터 조회 ----");
//		StudentVO insertResultVO = dao.selectOne(insertVO);
//		System.out.println(insertResultVO);
		
//		System.out.println("---- 수정(UPDATE) ----");
//		StudentVO updateVO = new StudentVO("2021011", "테스트11", 100, 90, 90);
//		int result = dao.update(updateVO);
//		System.out.println(">> 수정 건수 : " + result);
//		System.out.println("update 결과 : " + dao.selectOne(updateVO));
		
//		System.out.println("---- 수정(UPDATESTU) ----");
//		StudentVO updateStuVO = new StudentVO("2021001", "이름변경", 90, 90, 90);
//		int result2 = dao.updateStu(updateStuVO);
//		System.out.println(">> 입력건수 : " + result2);
//		
//		System.out.println("--- 입력데이터 조회 ----");
//		StudentVO updateStuResultVO = dao.selectOne(updateStuVO);
//		System.out.println(updateStuResultVO);
		

		System.out.println("---- 삭제(DELETE) ----");
		int deleteCnt = dao.delete(insertVO.getId());
		System.out.println("삭제건수 : " + deleteCnt);
		if(dao.selectOne(insertVO) == null) {
			 System.out.println(">>> ID : " + insertVO.getId() + "데이터가 없습니다");
		} else {
			System.out.println("데이터가 삭제되지않고 존재합니다 : " + dao.selectOne(insertVO));
		}
		
	}

}
