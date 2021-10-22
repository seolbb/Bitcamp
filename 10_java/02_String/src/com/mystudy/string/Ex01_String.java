package com.mystudy.string;

public class Ex01_String {

	public static void main(String[] args) {
		// String 클래스 : 문자열 저장, 처리하기 위한 클래스
		// 사용형식 2가지
		// String str = "홍길동"; // 기본 데이터 타입처럼 사용
		// String str = new String("홍길동); // 객체(인스턴스) 생성 사용
		
		String str1 = "Java";
		String str2 = "World";
		String strObj1 = new String("Java");
		String strObj2 = new String("World"); //str1.toString() 메소드 호출 처리됨
		System.out.println("strObj1 : " + strObj1);
		
		String str11 = "Java";
		
		// 참조형 데이터 비교 == : 객체비교(객체 주소값 비교)
		System.out.println("str1 : " + str1);
		System.out.println("str11 : " + str11);
		System.out.println("str1 == str11 : " + (str1 == str11));
		
		System.out.println("str1 : " + str1);
		System.out.println("strObj1 : " + strObj1);
		System.out.println("str1 == strObj1 : " + (str1 == strObj1));
		
		// equals() : 저장되어 있는 데이터(값) 비교(문자열비교)
		System.out.println("=== 문자열 비교는 equals() 메소드 사용 ===");
		System.out.println("str1.equals(str11) : " + (str1.equals(str11)));
		System.out.println("str1.equals(strObj1) : " + (str1.equals(strObj1)));

		System.out.println("----------------------------------");
		String str12 = "JAVA";
		//                 "JAVA"       "Java"
		System.out.println("Str12 : " + str12);
		System.out.println("StrObj1 : " + strObj1);
		System.out.println("str12.equals(strObj1) : " + str12.equals(strObj1));
		System.out.println("str12.equals(strObj1) : " + str12.equalsIgnoreCase(strObj1));

		//=========================================
		System.out.println("---------- concat() -----------");
		String a = "Hello ";
		String b = "Java ";
		String c = "World ";
		System.out.println("a + b + c : " + (a + b + c));
		System.out.println("a.concat(b)" + a.concat(b));
		
		// 체이닝 기법(chainning) 
		String result = a.concat(b).concat(c).concat("!!!");
		System.out.println("a.concat(b).concat(c).concat(\"!!!\")" + result);
	}

}




