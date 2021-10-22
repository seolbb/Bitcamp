package com.mystudy.interface1;

/* (실습) 클래스 만들기
 * 전화기 만들기
 * 속성: 타입(type) 전화번호(phoneNo)
 * 기능: 1. 전화 정보 보기(view)
 *		2. 전화걸기(call)
 *		3. 전화받기(receiveCall)
 *		4. 메시지 보내기
 *		5. 메시지 받기
*/
public class Phone {
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
	
	//
	public String getType() {
		return type;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	//
	// 전화 걸기 기능
	public void call() {
		System.out.println(">> 전화 걸기");
	}
	
	// 전화 받기 기능
	public void receiveCall() {
		System.out.println(">> 전화 받기");
	}
	
	// 전화 정보 보기
	public void view() {
		System.out.println("타입:" + type + ", 전화번호: " + phoneNo);
	}
	
	// 메시지 보내기
	public void sendSms() {
		System.out.println(">> 메시지 보내기");
	}
	
	// 메시지 받기
	public void receiveSms() {
		System.out.println(">> 메시지 받기");
	}
	
	
	
	
}
