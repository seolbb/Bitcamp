/* package 선언문 : 선택 항목이지만 기본적으로 사용한다.
 * 패키지구문 : java 파일의 맨 첫줄에 위치하며 한번만 작성한다.
 * 자바(class) 파일의 위치를 나타낸다.
 * 일반적으로 회사의 도메인명을 반대로 작성해서 사용한다.
 * 작성예) naver.com --> com.naver + 서비스명
 * 		 bitcamp.co.kr --> kr.co.bitcamp + 서비스명
 * 
 */
package class1.basic;

// import 선언문 : 선택항목이지만 일반적으로 사용한다.
//	(java.lang 패키지 이외의 패키지에 있는 타입 사용시 일반적으로 사용)
import java.util.Scanner;

// class 선언문 : 필수 항목
public class Ex01_package_import_class {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		
	}

}
