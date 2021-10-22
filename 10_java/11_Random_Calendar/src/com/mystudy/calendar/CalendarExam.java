package com.mystudy.calendar;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CalendarExam {

	public static void main(String[] args) {
		Date date = new Date();
		System.out.println("new Date() : " + date);
		
		// 년 : 입력된 년도 값에 1900이 더해진 결과값이 사용됨
		// 월 : 0~11 - 0:1월, 1:2월, 2:3월, ...
		date = new Date(2021 - 1900, 7 - 1, 29);
		System.out.println(date);
	
		System.out.println("---- Calendar ----");
		Calendar cal = Calendar.getInstance();
		System.out.println(cal);

		System.out.println("년도 : " + cal.get(Calendar.YEAR));
		System.out.println("월 : " + (cal.get(Calendar.MONTH) + 1));
		System.out.println("일 : " + cal.get(Calendar.DATE));
		System.out.println("일 : " + cal.get(Calendar.DAY_OF_MONTH));
		
		cal.add(Calendar.HOUR, 5); /* 현재시간에서 5시를 더해라 */
		System.out.println("오전오후 : " + cal.get(Calendar.AM_PM)); /* 0이면 오전 1이면 오후 */
		System.out.println("시(12시간) : " + cal.get(Calendar.HOUR));
		System.out.println("시(24시간) : " + cal.get(Calendar.HOUR_OF_DAY));
		System.out.println("분 : " + cal.get(Calendar.MINUTE));
		System.out.println("분 : " + cal.get(Calendar.SECOND));
		
		System.out.println("---------------------");
		// 년-월-일 시:분:초 또는 년/월/일 시:분:초
		String dateTime = cal.get(Calendar.YEAR)
				+ "-" + (cal.get(Calendar.MONTH) + 1)
				+ "-" + cal.get(Calendar.DATE)
				+ " " + cal.get(Calendar.HOUR_OF_DAY)
				+ ":" + cal.get(Calendar.MINUTE)
				+ ":" + cal.get(Calendar.SECOND);
		System.out.println(">> 년-월-일 시:분:초 : " + dateTime);
		System.out.println();
		cal.add(Calendar.YEAR, 2);
		cal.add(Calendar.MONTH, 2);
		cal.add(Calendar.DATE, 2);
		cal.add(Calendar.HOUR_OF_DAY, 2);
		cal.add(Calendar.MINUTE, 2);
		cal.add(Calendar.SECOND, 2);
		showDate(cal);
		
		System.out.println("====== SimpleDateFormat ======");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		date = new Date();
		System.out.println("new Date() : " + date);

		System.out.println("yyyy-MM-dd hh:mm:ss : " + sdf.format(date));
		sdf = new SimpleDateFormat("yyyy/MM/dd a h:m:s");
		System.out.println("yyyy/MM/dd a h:m:s : " + date);
	}

	static void showDate(Calendar cal) {
		String dateTime = cal.get(Calendar.YEAR)
				+ "-" + (cal.get(Calendar.MONTH) + 1)
				+ "-" + cal.get(Calendar.DATE)
				+ " " + cal.get(Calendar.HOUR_OF_DAY)
				+ ":" + cal.get(Calendar.MINUTE)
				+ ":" + cal.get(Calendar.SECOND);
		System.out.println(">> 년-월-일 시:분:초 : " + dateTime);
		
	}
}




