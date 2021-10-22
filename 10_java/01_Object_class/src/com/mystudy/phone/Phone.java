package com.mystudy.phone;

public class Phone {
	// 변수 선언
	String name;
	String type;
	int hsize;
	int vsize;
	boolean hasLCD;

	// 생성자
	public Phone(){} // 기본생성자 명시적 선언(정의)  

	Phone(String name, String type) {
		this.name = name; // this는 현재 객체(인스턴스)를 의미
		/*현재 객체에 있는 name이라는 변수에 파라미터로 들어온 name을 대입*/
		this.type = type;
	}

	Phone(String name, String type, boolean hasLCD){
//		this.name = name;
//		this.type = type;
		this(name, type); // 현재객체(인스턴스)의 생성자 호출
		this.hasLCD = hasLCD;
		}

	
	// 메소드
	void call() {
		System.out.println(">> 전화걸기");
	}
	
	void receiveCall() {
		System.out.println(">> 전화받기");
	}
	
	void sendSms(String msg) {
		System.out.println("[메시지전송]" + msg);
	}

	String receiveSms(String msg) {
		System.out.println("[메시지수신]" + msg);
		return msg;
	}
	
	void view() {
		System.out.println("--- 전화기 정보 ---");
		System.out.println("모델명 : " + name);
		System.out.println("타입 : " + type);
		System.out.println("가로크기 : " + hsize);
		System.out.println("세로크기 : " + vsize);
		System.out.println("LCD유무 : " + hasLCD);
	}
}






