package com.mystudy.ex01_buffered;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class BufferedReaderWriterExam {

	public static void main(String[] args) {
		// 버퍼(buffer) 기능이 구현되어 있는 클래스
		// BufferedReader, BufferedWriter
		// File -> FileReader -> BufferedReader

		// 변수 선언
		FileReader fr = null; /*파일을 읽기 위한 변수 선언*/
		FileWriter fw = null; /*파일을 쓰기 위한 변수 선언*/

		BufferedReader bufferedReader = null;
		BufferedWriter bufferedWriter = null;

		// 객체 생성
		try {
			// 파일로 부터 읽기 위한 객체(인스턴스) 생성
			File inFile = new File("file/data_utf8.txt"); /*해당 위치에 파일 생성*/
			fr = new FileReader(inFile);
			bufferedReader = new BufferedReader(fr); // 버퍼사용 + 파일읽기 기능

			// 파일에 쓰기 위한 객체 생성 --------------------------
			File outFile = new File("file/test_buf_rw_out.txt");
			fw = new FileWriter(outFile);
			bufferedWriter = new BufferedWriter(fw); // 버퍼사용 + 파일쓰기 기능

			// 간단히 쓰기
			bufferedWriter.write("안녕하세요. 자바 공부중입니다.\n");
			bufferedWriter.write("Hello Java!!!");
			bufferedWriter.newLine();
			bufferedWriter.newLine();
			bufferedWriter.write("재미있나요??");
			bufferedWriter.newLine();
			bufferedWriter.write("-------------------------");
			bufferedWriter.newLine();

			// 파일로부터 읽고, 파일에 쓰기(버퍼기능 이용) --------------------------
			// 파일에서 읽기 (한번 읽기)
			String str = bufferedReader.readLine(); /*라인단위로 읽기*/
			System.out.println("readLine() 처음읽은 값 : " + str);

			// 파일에 쓰기 (한번 쓰기)
			bufferedWriter.write(str);
			bufferedWriter.newLine(); // 줄바꿈처리

			// 남은 데이터 모두 읽고 쓰기
			str = bufferedReader.readLine(); // EOF : null 리턴
			while (str != null) {
				bufferedWriter.write(str);
				bufferedWriter.newLine();
				str = bufferedReader.readLine();
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				bufferedWriter.close();
				bufferedReader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
