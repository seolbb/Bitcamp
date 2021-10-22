package com.mystudy.scanner4_bank;
// 내가 한것
import java.util.Scanner;
//[실습] 은행의 ATM 기계 만들기
//1.입금  2.출금  3.통장확인  0.종료
//-----------------------------------
//계좌를 하나 만들고 입금/출금/통장확인 작업을 처리

//deposit withdraw
public class BankATM {
	private int money; // 통장계좌(금액)
	private Scanner scan = new Scanner(System.in);
	private int userChoice;

	public void startBank() {
		System.out.println(">> ATM 기계를 사용합니다");

		// 메뉴
		while (true) {
			boolean show = showMenu();
			if (!show) {
				System.out.println("종료합니다.");
				break;
			}
		}
	}

	private boolean showMenu() {
		System.out.println("1.입금 2.출금 3.통장확인 0.종료");
		System.out.print("작업선택: ");
		userChoice = scan.nextInt();
		// 1. 입금
		if (userChoice == 1) {
			// 1. 입금
			in();
		} else if (userChoice == 2) {
			// 2. 출금
			out();
		} else if (userChoice == 3) {
			// 3. 통장확인
			checkMoney();
		}
		return true;
	}

	private void in() {
		System.out.print(">> 입금액 : ");
		int deposit = scan.nextInt();
		money += deposit;
		checkMoney();
	}

	private void out() {
		while(true) {
			System.out.println(">> 출금액 : ");
			int withdraw = scan.nextInt();
			if (withdraw > money) {
				System.out.println("잔액이 부족합니다");
			} else {
			money -= withdraw;
			checkMoney();
			break;
			}
		}
	}

	private void checkMoney() {
		if (money > 0) {
			System.out.println("::통장금액 : " + money + "원");
		} else {
			System.out.println("잔액이 없습니다.");
		}
	}
}