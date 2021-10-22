package com.mystudy.exception1;

public class ExceptionFinally {

	public static void main(String[] args) {
		// try ~ catch ~ finally
		System.out.println("--- main() 시작 ---");
		int num = 20;
		int result = 0;
		try {
			System.out.println(">> try 문 시작");
			result = 100 / num;
			
			System.out.println(">> 연산처리 정상 실행");
			System.out.println(">> try 문 종료");
		} catch(ArithmeticException e) { // 정상적으로 돌아가면 catch부분은 실행 안됨
			System.out.println(">>>> catch문 실행");
		} finally {
			System.out.println("****> finally : 항상실행");
		}
		System.out.println(">> finally 다음 문장");
		System.out.println("result : " + result);
		System.out.println("--- main() 종료 ---");
	}

}
