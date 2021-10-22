package com.mystudy.string;
/* "홍길동","이순신","이순신","을지문덕","김유신","연개소문", "Tom", "TOM"
 	1. 위의 문자열 값을 저장할 수 있는 문자열 배열(names)변수를 선언하고 입력
 	2. 배열에 있는 값을 구분자 콤마(,)로 구분하여 한 라인에 출력
 		(홍길동,이순신,이순신,을지문덕,김유신,연개소문,tom,TOM)
 	3.
 	4.
 	5. 이름이 같은 데이터를 "인덱스번호:이름=인덱스번호:번호" 형태로 출력
 		예: 2.이순신=3.이순신
 		
 */

public class Ex04_StringExam2 {
	public static void main(String[] args) {

		String[] names = { "홍길동", "이순신", "이순신", "을지문덕", "김유신", "연개소문", "Tom", "TOM" };
		System.out.println("names 데이터 갯수 : " + names.length);

		System.out.println("------ 2번 ------");
		for (int i = 0; i < names.length; i++) {
			if (i == 0) {
				System.out.print(names[i]);
			} else {
				System.out.print("," + names[i]);
			}
		}

		System.out.println();
		// ---------- 다른 방법 ---------
		if (names.length > 0) {
			System.out.print(names[0]);
		}
		for (int i = 1; i < names.length; i++) {
			System.out.print("," + names[i]);
		}

		System.out.println();
		System.out.println("------ 3번 ------");

		if (names.length > 0) {
			System.out.print(names[0].charAt(0));
		}
		for (int i = 1; i < names.length; i++) {
			System.out.print("," + names[i].charAt(0));
		}

		System.out.println();
		System.out.println("------ 4번 ------");
		for (int i = 0; i < names.length; i++) {
			if (names[i].length() >= 4) {
				System.out.println(i + ":" + names[i]);
			}
		}

		System.out.println();
		System.out.println("------ 5번 ------");

		// 마지막 인덱스 : names.length - 1
		// 기준이되는 마지막 인덱스 : names.length - 2

		// 이중 반복문 만들기
		for (int gijun = 0; gijun < names.length - 1; gijun++) {
			for (int i = gijun + 1; i < names.length; i++) {
				if (names[gijun].equalsIgnoreCase(names[i])) {
					System.out.println(gijun + ":" + names[gijun] + "=" + i + ":" + names[i]);
				}
			}
		}
	}
}
