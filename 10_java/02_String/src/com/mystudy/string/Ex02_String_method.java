package com.mystudy.string;

import java.util.Arrays;

public class Ex02_String_method {
	public static void main(String[] args) {
		// String 클래스의 메소드들
		// charAt()
		System.out.println("--- charAt() ---");
		String str = "Java World";
		System.out.println("str : " + str);
		char ch = str.charAt(0);
		System.out.println("str.charAt(0) : " + ch);

		// char[] ch2 = {str.charAt(0), str.charAt(1), str.charAt(2), str.charAt(3)};
		char[] ch2 = new char[4];
		for (int i = 0; i < ch2.length; i++) {
			ch2[i] = str.charAt(i);
		}
		System.out.println("ch2 : " + Arrays.toString(ch2));
		
		System.out.println("--- compareTo() ---");
		System.out.println("java vs java : " + "java".compareTo("java"));  // 0
		System.out.println("aaa vs bbb : " + "aaa".compareTo("bbb")); // -1
		System.out.println("bbb vs aaa : " + "bbb".compareTo("aaa")); // 1
		System.out.println("ccc vs aaa : " + "ccc".compareTo("aaa")); // 2
		
		System.out.println(("aba vs aaa : " + "aba".compareTo("aaa"))); // 1
		
		System.out.println("--- copyValueOf() ---");
		char[] ch3 = {'a', 'b', 'c', 'd'};
		System.out.println("ch3 : " + Arrays.toString(ch3));
		
		String str3 = String.copyValueOf(ch3);
		System.out.println("String.copyValueOf(ch3) : " + str3);
		System.out.println("String.copyValueOf(ch3, 0, 2) : " + String.copyValueOf(ch3, 0, 2));
                      		/* 0번부터 2번째 인덱스 이전 까지(=1번째까지) */
	
		// 시작 문자열 여부 확인
		System.out.println("--- startsWith() ---");
		String str4 = "Java World";
		System.out.println("str4 : " + str4);
		System.out.println("str4.startsWith(\"Java\") : " + str4.startsWith("Java"));
	
		/* 몇번째 인덱스에 있는지*/
		System.out.println("--- indexOf() ---");
		System.out.println("str4.indexOf('a') : " + str4.indexOf('a'));
		System.out.println("str4.indexOf(\"a\") : " + str4.indexOf("a"));
	
		System.out.println("--- lastindexOf() ---");
		System.out.println("str4.lastindexOf('a') : " + str4.lastIndexOf('a'));
		System.out.println("str4.lastindexOf(\"a\") : " + str4.lastIndexOf("a"));

		System.out.println("--- isEmpty() ---");
//		str4 = "";
		System.out.println("str4.isEmpty() : " + str4.isEmpty());
	
		System.out.println("--- replace() ---");
		System.out.println("str4 : " + str4);
		System.out.println("str4.replace('a', 'b') : " + str4.replace('a', 'b')); /*a를 b로*/
		System.out.println("str4 : " + str4);
		
		
		System.out.println("--- replaceAll() ---");
		str4 = "java java";
		System.out.println("str4 : " + str4);
		System.out.println("ja -> JA : " + str4.replaceAll("ja", "JA"));
		
		System.out.println("ja -> JA : " + str4.replaceFirst("ja", "JA"));

		
		System.out.println("--- substring() ---");
		//     0123456789
		str = "Java World";
		System.out.println("str : " + str);
		System.out.println("str.substring(5) : " + str.substring(5));  /*5번부터 끝까지*/
	
		// beginIndex : 시작위치값 부터(포함)
		// endIndex : end 이전까지(불포함)
		System.out.println("str.substring(2,4) : " + str.substring(2,4)); /*2부터 4이전까지*/
		System.out.println(str.substring(0, str.length())); /*길이는 10이니 9까지*/
		
		// 뒤에서 2개 문자 제외하기
		System.out.println(str.substring(0, str.length()-2));
		
		
		System.out.println("--- toCharArray() ---");
		char[] ch4 = str.toCharArray();
		System.out.println("ch4 : " + ch4);
		System.out.println(Arrays.toString(ch4));
		System.out.println(ch4[0]);
		System.out.println(ch4[1]);
	
		
		System.out.println("--- toUpperCase(), toLowerCase(), trim() ---");
		str = "   Java World   ";
		System.out.println("str : -" + str + "-");
		System.out.println(str.toUpperCase());
		System.out.println(str.toLowerCase());
		System.out.println("str.trim() : -" + str.trim() + "-");
	
		
		System.out.println("--- String.valueOf() ---");
		int num = 100;
		System.out.println(num + 1); // 덧셈 연산
		System.out.println("" + num + 1); // 문자열 붙이기
		System.out.println(String.valueOf(num) + 1);
		String snum = String.valueOf(100);
	
	
	}
}






