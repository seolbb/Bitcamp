package com.mystudy.stringbuilder;

import java.util.StringTokenizer;

public class Ex03_StringTokenizer {
	
	public static void main(String[] args) {
		// String split() vs StringTokenizer
		System.out.println("--- String split() ---");
		String str = "사과,배,복숭아,,포도";
		System.out.println("str : " + str);
		
		/* split = 구분자 */
		String[] strSplit = str.split(",");  /* split 은 배열 */
		System.out.println("strSplit : " + strSplit.length);
		
		System.out.println("--- str.split(\",\") 결과 ---");
		for (int i = 0; i < strSplit.length; i++) {
//			System.out.println(strSplit[i]);
			System.out.println(i + " : " + strSplit[i]);
		}
		
		System.out.println("--- 개선된 for문 형태로 ---");
		/*strSplit 에있는 데이터를 str2에 담는다. 간단하고 편한 방법 */
		for(String str2 : strSplit) {
			System.out.println("-" + str2 + "-");
		}
		
		System.out.println("----------------");
		
		int idx = 0;   /* 이방법은 굳이 안씀 */
		for(String str2 : strSplit) {
			System.out.println(idx++ + ": -" + str2 + "-");
		}
		
		System.out.println("============================");
		
		System.out.println("---- StringTokenizer 사용----");  /* 빈문자는 무시한다. (String split 와의 차이점) */
		str = "사과,배,복숭아,,포도";
		StringTokenizer strToken = new StringTokenizer(str, ",");
		System.out.println("strToken.countTokens() : " + strToken.countTokens());  // 4 /*.countTokens() = .length 랑 같은 의미 */
		
		/* 담겨져 있는 데이터를 꺼내서 쓰는 방식 (재사용 불가-(String split 와의 차이점2))*/
		while(strToken.hasMoreTokens()) {
			String token = strToken.nextToken(); 
			System.out.println("-" + token + "-");
		}
		System.out.println("저장된 토큰 갯수 : " + strToken.countTokens());   // 0 
		
		System.out.println("----------------");
		
		System.out.println("--- for문을 사용한 토큰값 조회");
		strToken = new StringTokenizer(str, ",");  // 다시 토크닝함
		System.out.println("저장된 토큰 갯수 : " + strToken.countTokens());  // 4
		
		/* 이방법은 굳이 안씀 */
		/*nextToken 되는 순간 하나를 꺼내서 썼기때문에 countToken은 -1 됨 따라서 tokenCnt 를 따로 지정해줌*/
		int tokenCnt = strToken.countTokens();
		for(int i = 0; i < tokenCnt; i++) {
			String token = strToken.nextToken();  
			System.out.println("-" + token + "-");  
		}

		
		
		
	}
}











