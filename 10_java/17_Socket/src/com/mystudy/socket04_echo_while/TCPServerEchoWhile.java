package com.mystudy.socket04_echo_while;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class TCPServerEchoWhile {

	public static void main(String[] args) {
		// 클라이언트에서 보내는 메시지를 받고 다시 보내기 반복처리
		// 수신(input)메시지 화면 출력 후 클라이언트로 전송(output)
		// 클라이언트에서 종료요청시 까지

		ServerSocket server = null;
		BufferedReader br = null;
		PrintWriter pw = null;

		try {
			server = new ServerSocket(10000);
			System.out.println(">> 서버 시작");
			System.out.println(">> 클라이언트 접속 대기중");
			
			Socket socket = server.accept();
			System.out.println(">> 클라이언트 접속됨");
			
			// 연결된 소켓과 데이터를 주고 받기 위한 I/O 객체 생성
			InputStream is = socket.getInputStream();
			OutputStream os = socket.getOutputStream();
			
			// 바이트(byte) -> 문자(char) 처리계열로 변경 필터 적용
			InputStreamReader isr = new InputStreamReader(is);
			
			// 버퍼(buffer) 사용으로 편리하게 라인단위 입출력
			br = new BufferedReader(isr);
			pw = new PrintWriter(os);
			
			// 읽고 쓰기 반복
			while(true) {
				// 읽고
				String msg = br.readLine();
				
				// 클라이언트에서 작업 종료(exit)하면 종료 처리
				if(msg == null || "exit".equalsIgnoreCase(msg)) {
					System.out.println(">>> 서버를 중단합니다.");
					break;
				}
				System.out.println("받은 메시지 : " + msg);
				
					
				// 쓰기
				pw.println(msg);
				pw.flush(); // 버퍼 데이터 출력처리
			}
			
		} catch (IOException e) {
			e.printStackTrace();
			return; /* 이렇게 할수도 있음 오류가 발생하면 끝남 */
		} finally {
			if(br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(pw != null) {
				pw.close();
			}
		}
		
		try {
			server.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(">> 서버 종료");
	}

}
