package com.mystudy.ex03_isr;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

public class InputStreamReader_Exam {

	public static void main(String[] args) {
		// InputStream 타입을 -> Reader 로 변경
		// byte 처리 계열 -> 문자(Character) 처리 계열 전환
		// 데이터를 byte 계열로 읽어들이고 최종적으로 문자단위 처리
		// InputStreamReader : InputStream -> Reader 전환
		// OutputStreamWriter : OutputStream -> Writer 전환

		File file = new File("file/test_isr.txt");
		FileInputStream fis = null;
		InputStreamReader isr = null;
		BufferedReader br = null;

		try {
			fis = new FileInputStream(file);

//			int readByte = fis.read();
//			System.out.println((char)readByte);
//			
//			readByte = fis.read();
//			System.out.println((char)readByte);  // 한글 깨짐

			isr = new InputStreamReader(fis); 
			int readIsr = isr.read();
			System.out.println((char) readIsr);

			readIsr = isr.read(); 
			System.out.println((char) readIsr);

			// 버퍼기능 사용해서 읽기(라인단위)
			br = new BufferedReader(isr);
			String str = br.readLine();
			System.out.println(str);

			while (true) {
				str = br.readLine(); // EOF를 만나면 null 리턴
				if (str == null)
					break;
				System.out.println(str);
			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
