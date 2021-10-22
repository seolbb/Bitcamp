package com.test.interfaceimpl2;

import java.util.List;

public class StudentManagerTest {

	public static void main(String[] args) {
		StudentManagerImpl students = new StudentManagerImpl();

		StudentVO stu1 = new StudentVO("210101", "홍길동", 100, 95, 80);
		StudentVO stu2 = new StudentVO("210102", "이순신", 95, 90, 80);
		StudentVO stu3 = new StudentVO("210103", "이순신", 90, 95, 95);
		StudentVO stu4 = new StudentVO("210104", "손설빈", 100, 100, 100);
		StudentVO stu5 = new StudentVO("210105", "김댕댕", 95, 95, 95);

		students.insert(stu1);
		students.insert(stu2);
		students.insert(stu3);
		students.insert(stu4);
		students.insert(stu5);

		System.out.println("=== insert() 테스트 ===");
		students.printData();
		System.out.println("---------------------");

		System.out.println("=== selectOne() 테스트 ===");
		students.selectOne("210101");
		StudentVO selectOne = students.selectOne("210101");
		System.out.println(selectOne);
		System.out.println("---------------------");

		System.out.println("=== selectList() 테스트 ===");
		List<StudentVO> selectList = students.selectList("홍길동");
		System.out.println(selectList);
		System.out.println("---------------------");

		System.out.println("=== selectAll() 테스트 ===");
		List<StudentVO> selectAll = students.selectAll();
		System.out.println(selectAll);
		System.out.println("---------------------");

		System.out.println("=== update() 테스트 ===");
		stu1 = new StudentVO("210101", "홍길동", 10, 20, 30);
		int up = students.update(stu1);
		if (up == 1) {
			System.out.println("수정 완료");
			students.printData();
		} else {
			System.out.println("수정 실패");
		}
		System.out.println("---------------------");

		System.out.println("=== delete() 테스트 ===");
		int dl = students.delete("210103");
		if (dl == 1) {
			System.out.println("삭제 완료");
			students.printData();
		} else {
			System.out.println("삭제 실패");
		}
		System.out.println("---------------------");

	}

}
