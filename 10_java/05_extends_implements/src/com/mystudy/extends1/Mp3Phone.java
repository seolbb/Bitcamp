package com.mystudy.extends1;

class Mp3Phone {
	private String type;
	private String phoneNo;
	
	// 생성자------------------------------------
	public Mp3Phone(String Mp3Phone) {
		this.type = "Mp3Phone 타입";
		this.phoneNo = Mp3Phone;
	}

	public Mp3Phone(String type, String phoneNo) {
		super();
		this.type = type;
		this.phoneNo = phoneNo;
	}
	
	// 메소드------------------------------------
	public String getType() {
		return type;
	}

	public String getPhoneNo() {
		return phoneNo;
	}
	//=========================================
	
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
	
	// 음악 플레이 기능
	public void playMusic() {
		System.out.println(">> 음악 플레이");
	}
}
