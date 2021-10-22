package com.test.interfaceimpl;

import java.util.List;

public class StudentManagerTest {

	public static void main(String[] args) {
		// 5명 학생 정보 만들고 구현메소드 확인(이름 중복 2명 이상)
		StudentManagerImpl students = new StudentManagerImpl();
		
		StudentVO stu1 = new StudentVO("210101", "홍길동", 100, 95, 80);
		StudentVO stu2 = new StudentVO("210102", "이순신", 95, 90, 80);
		StudentVO stu3 = new StudentVO("210103", "이순신", 90, 95, 95);
		StudentVO stu4 = new StudentVO("210104", "손설빈", 100, 100, 100);
		StudentVO stu5 = new StudentVO("210105", "김댕댕", 95, 95, 95);
			
		students.add(stu1);
		students.add(stu2);
		students.add(stu3);
		students.add(stu4);
		students.add(stu5);
		
		System.out.println("=== add() 테스트 ===");
		students.printData();
		System.out.println("------------------");
		
		System.out.println("=== find() 테스트 ===");
		StudentVO findVO = students.find("210101");
		System.out.println("찾은 학생 : " + findVO);
		System.out.println("------------------");
		
		System.out.println("=== findList() 테스트 ===");
		List<StudentVO> findList = students.findList("이순신");
		System.out.println(findList);
		System.out.println("------------------");
		
		System.out.println("=== changeKor() 테스트 ===");
		students.changeKor("210101", 90);
		System.out.println(stu1);
		System.out.println("------------------");
		
		System.out.println("=== changeEng() 테스트 ===");
		students.changeKor("210101", 90);
		System.out.println(stu1);
		System.out.println("------------------");
		
		System.out.println("=== changeMath() 테스트 ===");
		students.changeKor("210101", 90);
		System.out.println(stu1);
		System.out.println("------------------");
		
		
		
		
		
		
		
		

	}

}
















