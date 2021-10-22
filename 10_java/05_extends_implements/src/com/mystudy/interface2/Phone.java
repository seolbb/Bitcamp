package com.mystudy.interface2;

// 인터페이스(interface) 구현(implements)하는 방식으로 클래스 만들기
public class Phone implements I_Phone {
	private String type;
	private String phoneNo;
	
	
	public Phone(String phoneNo) {
		this.type = "Phone 타입";
		this.phoneNo = phoneNo;
	}
	
	public Phone(String type, String phoneNo) {
		this.type = type;
		this.phoneNo = phoneNo;
	}
	
	public String getType() {
		return type;
	}

	public String getPhoneNo() {
		return phoneNo;
	}
	
	@Override
	public void view() {
		System.out.println("타입:" + type + ", 전화번호: " + phoneNo);

	}

	@Override
	public void call() {
		System.out.println(">> 전화 걸기");

	}

	@Override
	public void receiveCall() {
		System.out.println(">> 전화 받기");

	}

	@Override
	public void sendSMS() {
		System.out.println(">> 메시지 보내기");

	}

	@Override
	public void receiveSMS() {
		System.out.println(">> 메시지 받기");
	}

}
