package com.mystudy.exception1;

public class ExceptionExam {

	public static void main(String[] args) {
		System.out.println("--- main() 시작 ---");
		int num = 100;
		int num1 = 0;
		int result = 0;
		System.out.println(">> 연산 시작");
		
		// 예외처리
		if(num1 == 0) {
			System.out.println("[예외발생] 나누는 값이 0 입니다.");
		} else {
			result = num / num1;
			System.out.println("result : " + result);
		}
		
		// try ~ catch 문으로 예외 처리
		System.out.println("--- try ~ catch 문으로 예외 처리 ---");
		try {
			result = num / num1; // java.lang.ArithmeticException: / by zero
		} catch(ArithmeticException ex) {
			System.out.println("[예외발생-메시지] " + ex.getMessage());
//			ex.printStackTrace();  /*오류 발생 메시지를 보고싶을때*/
		} catch(RuntimeException e) {
			System.out.println("[예외발생-runtime] " + e.getMessage());
		} catch(Exception e) {
			System.out.println("[예외발생] 0으로 나누려고 했습니다.");
		}
		
		System.out.println("-------------------------");
//		result = num / num1; // JVM 에서 보여주는 오류 메시지
		
		
	}

}
