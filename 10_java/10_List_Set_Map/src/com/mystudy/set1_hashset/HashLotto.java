package com.mystudy.set1_hashset;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;

public class HashLotto {

	public static void main(String[] args) {
		// Set 을 이용한 로또 만들기 : 1~45 랜덤숫자 6개를 Set에 저장
		// 로또번호 6개를 추첨하고, 작은 숫자부터 순서대로 화면 출력
		// Math.random() : (int)(Math.random() * 45) + 1
				// (int)(Math.random() * 45 --> 0~44
		
		//---------- 정렬도 한 번 진행
		// 출력은 작은 숫자부터 큰 숫자 형태로
		// 예) 금주의 로또 번호 : 5, 8, 10, 25, 33, 41
		//----------------------------------------
		
		HashSet<Integer> lottoSet = new HashSet<>();
		int lottoNo;
		
		// 굳이 포문을 안돌려도 됨
//		for( ; lottoSet.size() < 6;) { // 중복값때문에 lottoSet.size
//			lottoNo = (int)(Math.random() * 45) + 1;
//			lottoSet.add(lottoNo);
//		}
		
		while(lottoSet.size() < 6) {
			lottoSet.add((int)(Math.random() * 45) + 1);
		}
		
		System.out.println("로또번호: " + lottoSet);
		
		System.out.println("--- 정렬작업 진행 ---");  // Collections.sort : 오름차순정렬
		
		ArrayList<Integer> list = new ArrayList<>(lottoSet);
		System.out.println("list : " + list);
		
		Collections.sort(list);  // Collections.sort() 에는 list 형태만 전달가능
		
		System.out.println("정렬된 로또번호 : " + list);

	}

}
