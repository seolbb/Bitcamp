package com.mystudy.extends2;

// (실습) 클랙스 상속(extends) 해서 클래스 생성하기
/*
WebPhone 클래스 작성
Phone 클래스를 상속확장해서 작성
생성자 정의
	-PhoneNO 만 받아서 객체(인스턴스) 생성 : 타입명 "WebPhone타입" 적용
기능 : 전화 걸고, 받고, 전화 정보 보기, 웹검색 할 수 있는 전화기
웹 검색 기능
	- webSearch(): ">>WebPhone - 웹 검색" 문구 화면 출력
*/
//public class WebPhone extends Phone {
	public class WebPhone extends Mp3Phone {
	// 생성자
	public WebPhone(String PhoneNo) {
		super("WebPhone타입", PhoneNo);
	}
	
	public WebPhone(String type, String PhoneNo) {
		super(type, PhoneNo);
	}
	
	// 메소드
	public void webSearch() {
		System.out.println(">> WebPhone - 웹 검색");
	}
	
	public void webSearch(String word) { // 메소드 오버로딩(overloading)
		System.out.println(">> WebPhone - 웹 검색" + word + " 로 검색");
	}
	
}
