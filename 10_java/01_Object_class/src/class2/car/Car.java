package class2.car;

/* 자동차 클래스
	속성 : 차량명, 모델명, 차량색상          --> 변수
	기능 : 가고, 서고, 뒤로가고, 차량정보확인   --> 메소드
 */
public class Car {
	// 필드 변수 선언 (속성)
	String name = "마이카"; // 차량명
	String model; // 모델명 /* 이렇게 초기값 설정을 안할수도 있음.*/
	String color; // 차량색
	
	// final 제한자 : 변수에 값이 할당되면 더이상 변경할수 없다.
	// final 변수 : 상수화된 변수(상수)
	final int CAR_LENGTH = 350; // 차량 길이
	final int CAR_WIDTH = 200; // 차량폭
	
	// 생성자 ------------------------    /*생성자는 클래스명과 일치*/
	public Car() {
		model = "드림카";
		color = "무지개색";
	}
	
	
	Car (String n, String m, String c){
		name = n;
		model = m;
		color = c;
	}
	
	// 메소드(동작, 기능, 함수) ------------------------
	void run() {
		System.out.println(">> 앞으로 이동");
	}
	
	void run(int speed) {
		System.out.println(">> 앞으로 이동" + speed + "km 속도로 이동");
	}
	
	void stop() {
		System.out.println(">> 멈춤");
	}
	
	void back() {
		System.out.println(">> 뒤로 이동");
	}
	
	void dispData() {
			System.out.println("자동차이름 : " + name);
			System.out.println("모델명 : " + model);
			System.out.println("색상명 : " + color);
			System.out.println("차량길이 : " + CAR_LENGTH);
			System.out.println("차량폭 : " + CAR_WIDTH);
			System.out.println("-----------------");
		}


	@Override
	public String toString() {
		return "Car [name=" + name + ", model=" + model + ", color=" + color + ", CAR_LENGTH=" + CAR_LENGTH
				+ ", CAR_WIDTH=" + CAR_WIDTH + "]";
	}	
	
	
}
