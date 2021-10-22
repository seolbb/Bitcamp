package com.test.test;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

public class Test {

	public static void main(String[] args) {
		ArrayList<StudentVO> list = new ArrayList<StudentVO>();
		FileReader fr = null;
		FileWriter fw = null;
		BufferedReader br = null;
		BufferedWriter bw = null;

		// 읽기
		File file = new File("file/data_utf8.txt");
		try {
			fr = new FileReader(file);
			br = new BufferedReader(fr);

			StudentVO stu = null;

			String line = br.readLine();
			while (line != null) {
				String[] strSplit = line.split(",");
				stu = new StudentVO();
				stu.setId(strSplit[0]);
				stu.setName(strSplit[1]);
				stu.setKor(Integer.parseInt(strSplit[2]));
				stu.setEng(Integer.parseInt(strSplit[3]));
				stu.setMath(Integer.parseInt(strSplit[4]));
				list.add(stu);
				line = br.readLine();
			}
			
			// 쓰기
			File outFile = new File("file/result.txt");
			fw = new FileWriter(outFile);
			bw = new BufferedWriter(fw);

			for (int i = 0; i < list.size(); i++) {
				bw.write(list.get(i).getId() + "," + list.get(i).getName() + "," + list.get(i).getKor() + ","
						+ list.get(i).getEng() + "," + list.get(i).getMath() + "," + list.get(i).getTot() + ","
						+ list.get(i).getAvg());
				bw.newLine();
				bw.flush();
			}
			
			printData(list);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				bw.close();
				br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	static void printData(ArrayList<StudentVO> list) {
		for(StudentVO vo : list) {
			System.out.println(vo.getId() + "," + vo.getName() + "," + vo.getKor() + "," + vo.getEng() + "," + vo.getMath() + "," +
		 vo.getTot() + "," + vo.getAvg());
		}
	}
	
}