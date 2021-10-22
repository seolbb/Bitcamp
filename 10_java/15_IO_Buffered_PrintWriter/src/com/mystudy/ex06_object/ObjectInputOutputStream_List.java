package com.mystudy.ex06_object;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

public class ObjectInputOutputStream_List {

	public static void main(String[] args) {
		// StudentVO 객체들을 ArrayList에 담아서 파일에 저장하고
		// 파일에서 읽어들인 ArrayList 객체에 담긴 VO 정보를 화면에 출력
		File file = new File("file/object_io_list.data");

		System.out.println(">>> 저장할 데이터 작성");
		StudentVO stu1 = new StudentVO("21001", "김유신", 95, 90, 85);
		StudentVO stu2 = new StudentVO("21002", "홍길동", 100, 90, 81);
		System.out.println("stu1 : " + stu1);
		System.out.println("stu2 : " + stu2);
		System.out.println("=======================");

		// (실습)
		// ArrayList에 담기
		List<StudentVO> list = new ArrayList<>();
		list.add(stu1);
		list.add(stu2);
		System.out.println(list);
		System.out.println("-----------------------");

		// ArrayList 타입의 객체를 파일에 저장(Output)
		System.out.println("==== List를 파일에 출력(Output) ====");
		try (FileOutputStream fos = new FileOutputStream(file); 
				ObjectOutputStream oos = new ObjectOutputStream(fos);) {
			oos.writeObject(list);
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 파일에 저장된 ArrayList 객체를 읽어서 화면출력(Input)
		// 화면출력시 toString() 사용하지 말고 필드값 추출해서 화면 출력
		System.out.println("==== List를 파일에서 읽기(Input) ====");
		try (FileInputStream fis = new FileInputStream(file); 
				ObjectInputStream ois = new ObjectInputStream(fis);) {

			ArrayList<StudentVO> readList = (ArrayList<StudentVO>) ois.readObject(); /*ArrayList<StudentVO>로 형변환*/
			System.out.println(readList);

			for (StudentVO vo : readList) { /*readList에 있는 데이터를 vo에 담아*/
				System.out.println(vo.getName() + "\t" + vo.getTot() + "\t" + vo.getAvg());
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

}
