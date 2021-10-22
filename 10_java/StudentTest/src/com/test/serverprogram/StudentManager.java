package com.test.serverprogram;

import java.util.HashMap;
import java.util.Map;


public class StudentManager {

	public static void main(String[] args) {
		// 기본 생성 학생정보 3명
		//  "홍길동", 100, 90, 81
		//  "이순신", 95, 88, 92
		//  "김유신", 90, 87, 77
		//--------------------------------------
		
		//1. 제공된 3명과 추가한 2명 합계 5명의 학생데이터를 생성하시오.
		StudentVO stu1 = new StudentVO("홍길동", 100, 90, 81);
		StudentVO stu2 = new StudentVO("이순신", 95, 88, 92);
		StudentVO stu3 = new StudentVO("김유신", 90, 87, 77);
		StudentVO stu4 = new StudentVO("손설빈", 100, 100, 100);
		StudentVO stu5 = new StudentVO("김땡땡", 99, 98, 97);
		
		//2. 5명의 데이터를 선택한 List / Set / Map 타입의 저장공간을 만들고 저장하시오.
		Map<String, StudentVO> map = new HashMap<>();
		map.put(stu1.getName(), stu1);
		map.put(stu2.getName(), stu2);
		map.put(stu3.getName(), stu3);
		map.put(stu4.getName(), stu4);
		map.put(stu5.getName(), stu5);
		
		//3. 저장되어 있는 학생데이터를 성명, 국어, 영어, 수학, 총점, 평균을 목록형태로 화면출력하시오
		for(StudentVO student : map.values()) {
			student.printData();
		}
		System.out.println("----------------------------------------------");
		//4. <홍길동> 학생의 데이터 중 영어점수를 95점, 수학점수를 85점으로 수정하고 수정된 데이터를 출력하시오.
		StudentVO vo = map.get("홍길동");
		vo.setEng(95);
		vo.setMath(85);
		vo.printData();
		System.out.println("----------------------------------------------");
		//5. 최종 처리 완료된 모든 학생 정보를 출력하시오.
		System.out.println("< 최종 학생 정보 >");
		for(StudentVO student : map.values()) {
			student.printData();
		}
		System.out.println("----------------------------------------------");
		//6. 학생데이터 중 성명, 총점, 평균만 화면에 출력하시오
		System.out.println("<" + "성명" + "\t" + "총점" + "\t" + "평균" + ">");
		for(StudentVO student : map.values()) {
			student.printData2();
		}
	}

}
