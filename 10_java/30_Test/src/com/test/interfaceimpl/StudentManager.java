package com.test.interfaceimpl;

import java.util.List;

public interface StudentManager {
	boolean add(StudentVO obj); //추가하는 기능
	StudentVO find(String id); // 찾는 기능
	List<StudentVO> findList(String name); // 이름으로 검색했을때 그 이름에 해당하는 사람들을 찾아주는 기능
	
	boolean changeKor(String id, int kor); // id에 해당되는 사람의 국어점수를 변경하는 기능
	boolean changeEng(String id, int eng);
	boolean changeMath(String id, int math);
	
	
	
}
