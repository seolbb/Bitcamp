package com.mystudy.scanner3_scissors;

import java.util.Scanner;

/* 
컴퓨터와 함께 가위(1) 바위(2) 보(3) 게임
0. 컴퓨터가 가위, 바위 보를 선택(Math.random() or Random)
1. 가위, 바위, 보 선택 메뉴 출력
2. 선택값 입력
3. 결과 비교후 승자, 패자 결정
(반복) 게임 반복 진행 - 0선택시 종료 
 */
public class ScissorsGame {

	private Scanner scan = new Scanner(System.in);
	private static final String SCISSORS = "가위";
	private static final String ROCK = "바위";
	private static final String PAPER = "보";
	private boolean oneMoreGame = true;

	public void startGame() {
		System.out.println(">>> 가위, 바위, 보 게임을 시작합니다.");

		while (oneMoreGame) {

			// 0. 컴퓨터가 가위, 바위, 보를 선택
			int comSelect = (int) (Math.random() * 3) + 1;
//			System.out.println("comSelect : " + comSelect);

			// 1. 가위, 바위, 보 메뉴 보여주고 선택하기
			System.out.println(">> 가위, 바위, 보중에 하나를 선택하시오");
			System.out.println("1.가위 2.바위 3.보");
			System.out.print(">> 당신의 선택은?(1~3) : ");

			// 2. 선택값 입력
			int select = Integer.parseInt(scan.nextLine());

			String strComputer = "";
			if (comSelect == 1) {
				strComputer = SCISSORS;
			} else if (comSelect == 2) {
				strComputer = ROCK;
			} else {
				strComputer = PAPER;
			}

			String strPerson = "선택안함";
			switch (select) {
			case 1:
				strPerson = SCISSORS;
				break;
			case 2:
				strPerson = ROCK;
				break;
			case 3:
				strPerson = PAPER;
				break;
			default:
				System.out.println("1~3 중에 하나를 선택하세요");
			}

			// 3. 결과 비교 후 승자, 패자 결정
			String result = "결정안됨";
			// 사람이 가위를 낸 경우
			if (SCISSORS.equals(strPerson)) {
				if (SCISSORS.equals(strComputer)) {
					result = "무승부";
				}
				if (ROCK.equals(strComputer)) {
					result = "컴퓨터 승";
				}
				if (PAPER.equals(strComputer)) {
					result = "사용자 승";
				}
			}
			// 사람이 바위를 낸 경우
			if (ROCK.equals(strPerson)) {
				if (SCISSORS.equals(strComputer)) {
					result = "사용자 승";
				}
				if (ROCK.equals(strComputer)) {
					result = "무승부";
				}
				if (PAPER.equals(strComputer)) {
					result = "컴퓨터 승";
				}
			}

			// 사람이 보를 낸 경우
			if (PAPER.equals(strPerson)) {
				if (SCISSORS.equals(strComputer)) {
					result = "컴퓨터 승";
				}
				if (ROCK.equals(strComputer)) {
					result = "사용자 승";
				}
				if (PAPER.equals(strComputer)) {
					result = "무승부";
				}
			}

			// 결과 출력
			System.out.println("---- 결과 ----");
			System.out.println(">> 나의 선택 : " + strPerson);
			System.out.println(">> 컴퓨터 선택 : " + strComputer);
			System.out.println("결과 : " + result);

			// 추가 게임 여부 확인
			System.out.println("-----------------");
			System.out.print("> 한번 더 하시겠습니까?(y/n) : ");
			String yn = scan.nextLine();
			if("n".equalsIgnoreCase(yn)) {
				System.out.println(">> 게임을 종료합니다.");
				oneMoreGame = false;
			}
		}
	}
	
}
