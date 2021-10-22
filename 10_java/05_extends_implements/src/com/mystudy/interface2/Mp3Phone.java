package com.mystudy.interface2;

// 전화기 정보확인, 전화걸기, 전화받기, 문자보내기, 문자받기, 음악재생
public class Mp3Phone extends Phone implements I_Mp3Phone {
	
	public Mp3Phone(String phoneNo) {
		super("Mp3Phone타입, phoneNo");
	}
	public Mp3Phone(String type, String phoneNo) {
		super(type, phoneNo);
	}
	
	@Override
	public void playMusic() {
		System.out.println(">> Mp3Phone - 음악플레이");
	}
	

}
