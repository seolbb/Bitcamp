package com.mystudy.interface2;

// 전화기 기본기능 + 음악플레이 + 웹서치기능
public interface I_WebPhone extends I_Phone, I_Mp3Phone{
//	public abstract void view();
//	public void call();
//	void receiveCall();
//	void sendSMS();
//	void receiveSMS();
//	
//	// Mp3 기능
//	void playMusic();
	/* extends ... 로 추가해서 필요없음*/
	
	// 웹서치 기능
	void webSearch();

}
