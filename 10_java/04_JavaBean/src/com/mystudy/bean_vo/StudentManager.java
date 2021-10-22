package com.mystudy.bean_vo;

public class StudentManager {

	public static void main(String[] args) {
		/* 3명의 성적처리
		   홍길동 100 90 81
		   이순신 95 88 92
		   김유신 90 87 77
		   ================
		   홍길동 100 90 81 271 90.33
		   이순신  95 88 92 275 91.66
		   김유신  90 87 77 254 84.66
		 */
		
		// 입력
		StudentVO stu1 = new StudentVO("홍길동", 100, 90, 81);
		StudentVO stu2 = new StudentVO("이순신", 95, 88, 92);
		StudentVO stu3 = new StudentVO("김유신", 90, 87, 77);
		
		// 출력
		stu1.printData();
		stu2.printData();
		stu3.printData();
		
		//==============================
		System.out.println("==== 배열에 저장해서 사용 ====");
		StudentVO[]	students = new StudentVO[3];
		students[0] = stu1;
		students[1] = stu2;
		students[2] = stu3;
		
		System.out.println("==== 배열데이터 화면 출력 ====");
		students[0].printData();
		students[1].printData();
		students[2].printData();
		
		System.out.println("------------");
		printData(students);
	
	}
	static void printData(StudentVO[] students) {
		// 전달받은 배열 데이터를 화면에 출력
		for(StudentVO vo : students) { //students데이터를 vo에 담아
			vo.printData();
		}
	}

}
