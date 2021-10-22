package com.test.interfaceimpl2;

import java.util.List;

public interface StudentManager {
	int insert(StudentVO vo); //입력
	StudentVO selectOne(String id); //조회(검색)
	List<StudentVO> selectList(String name); //이름으로 검색
	List<StudentVO> selectAll(); //전체데이터 검색
	int update(StudentVO vo); //수정
	int delete(String id); //삭제
}
