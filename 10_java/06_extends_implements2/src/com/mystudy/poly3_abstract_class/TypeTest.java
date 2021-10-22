package com.mystudy.poly3_abstract_class;

public class TypeTest {

	public static void main(String[] args) {
//		AbstractAnimal animal = new AbstractAnimal(); --> 추상클래스이기 때문에 new 로 객체 생성 불가능
		Cat cat = new Cat();
		Dog dog = new Dog();
		
		sound(cat);
		sound(dog);

	}

	// 메소드 오버라이딩 활용
	static void sound(AbstractAnimal animal) {
		animal.sound();
	}

}
