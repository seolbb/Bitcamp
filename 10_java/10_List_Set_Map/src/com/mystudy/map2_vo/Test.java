package com.mystudy.map2_vo;

import java.util.HashMap;
import java.util.Map;

public class Test {
	//   "홍길동", 100, 90, 81
	//   "이순신", 95, 88, 92
	//   "김유신", 90, 87, 77
	public static void main(String[] args) {
		StudentVO stu1 = new StudentVO("홍길동", 100, 90, 81);
		StudentVO stu2 = new StudentVO("이순신", 95, 88, 92);
		StudentVO stu3 = new StudentVO("김유신", 90, 87, 77);
		
		Map<String, StudentVO> map = new HashMap<>();
		map.put(stu1.getName(), stu1);
		map.put(stu2.getName(), stu2);
		map.put(stu3.getName(), stu3);
		
		// 전체 데이터 출력
		for(StudentVO student : map.values()) {
			student.printData();
		}
		
		System.out.println("--------------------");
		
		StudentVO vo = map.get("홍길동");
		vo.setEng(95);
		vo.setMath(85);
		vo.printData();
		
		System.out.println("--------------------");
		
		for(StudentVO student : map.values()) {
			student.printData();
		}
		
		System.out.println("--------------------");
		System.out.println("성명 : " + vo.getName());
		System.out.println("총점 : " + vo.getTot());
		System.out.println("평균 : " + vo.getAvg());		
		
		System.out.println("--------------------");

	}

}
