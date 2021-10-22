package com.mystudy.poly2_overriding;

public class Cat extends Animal {
	/* 메소드 오버라이딩(Method Overriding)
	   상속관계(확장, extends)에 있는클래스에서
	   수퍼(부모)타입에 있는 메소드를 서브(잔여)타입 클래스에서 재정의하는것
	   - 선언은 동일하고, 기능만 다르게 구현한다.
	   - 동일 형태: 리턴타입, 메소드명, 파라미터(타입/갯수/순서)가 동일
	*/

	@Override // 오버라이딩 된 메소드를 알리는 어노테이션(컴파일러 사용 주석)
	void sound() {
//		super.sound(); // 부모클래스의 기능을 그대로 사용
		System.out.println(">> 야옹 야옹");
	}
}
