package com.mystudy.scanner4_bank;

// 강사님 코드
import java.util.Scanner;
//[실습] 은행의 ATM 기계 만들기
//1.입금  2.출금  3.통장확인  0.종료
//-----------------------------------
//계좌를 하나 만들고 입금/출금/통장확인 작업을 처리

//deposit withdraw
public class BankATM2 {
	private int money; // 통장계좌(금액)
	private Scanner scan = new Scanner(System.in);
	private static final String ERROR_MESSAGE_FAULT_SELECT = "[예외발생] 잘못된 값이 입력되었습니다.\" + \"메뉴(0~3) 숫자만 입력하세요";
	private int userChoice;

	public void startBank() {
		System.out.println(">> ATM 기계를 사용합니다");
		while (true) {
			if (!isRunningATM()) {
				scan.close();
				break;
			}
		}
		System.out.println(">> ATM 기계 사용을 종료합니다");
	}

	private boolean isRunningATM() {
		boolean isContinue = true;
		System.out.println(">>> ATM 기계 사용중");
		// 메뉴 및 선택 메시지 출력
		showMenu();
		// 작업선택하기
		int select = -1;
		try {
			select = Integer.parseInt(scan.nextLine());
			if (select < 0 || select > 3) {
				System.out.println(ERROR_MESSAGE_FAULT_SELECT);
				return true;
			}
		} catch (NumberFormatException e) {
			System.out.println(ERROR_MESSAGE_FAULT_SELECT);
			return true;
		}
		if (select == 0) {
			return false;
		}
		if (select == 1) {
			System.out.println("---입금처리");
			inputMoney();
			showMoney();
		} else if (select == 2) {
			System.out.println("---출금처리");
			outputMoney();
			showMoney();
		} else if (select == 3) {
			System.out.println("---통장확인");
			showMoney();
		}

		return isContinue;
	}

	private void showMenu() {
		System.out.println("-------------------------");
		System.out.println("1.입금 2.출금 3.통자확인 0.종료");
		System.out.println("-------------------------");
		System.out.println(">> 작업선택 : ");
	}

	private void inputMoney() {
		while (true) {
			System.out.println(">> 입금액 : ");
			try {
				money += Integer.parseInt(scan.nextLine());
				break; // 정상 처리되었을때
				
				
			} catch (NumberFormatException e) {
				System.out.println("[예외발생] 잘못된 값이 입력되었습니다.\" + \"메뉴(0~9) 숫자만 입력하세요");
//				continue; // 비정상처리 되었을때 다시 작업
			}
			System.out.println(">>> 입금액을 다시 입력하세요");
		}
	}
	
	private void outputMoney() {
		while (true) {
			System.out.println(">> 출금액 : ");
			try {
				money -= Integer.parseInt(scan.nextLine());
				break; // 정상 처리되었을때
				
			} catch (NumberFormatException e) {
				System.out.println("[예외발생] 잘못된 값이 입력되었습니다.\" + \"메뉴(0~9) 숫자만 입력하세요");
//				continue; // 비정상처리 되었을때 다시 작업
			}
			System.out.println(">>> 출금액을 다시 입력하세요");
		}
	}
	
	private void showMoney() {
		System.out.println("::통장금액 : " + money + "원");
	}
	
}
