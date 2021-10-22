package com.mystudy.poly5_interface2;

public abstract class AbstractAnimal implements Animal {

	@Override
	public void eat() {
		System.out.println(">> 먹는다");
	}

	@Override
	public void sleep() {
		System.out.println(">> 잠을 잔다");
	}

	@Override  /* 구상체마다 다르게 적용하고싶으니 abstract 처리*/
	public abstract void sound(); // 선언만 한 추상메소드임. 구현은 구현체(클래스)에서

}
