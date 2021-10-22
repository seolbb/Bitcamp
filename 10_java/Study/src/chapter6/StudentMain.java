package chapter6;

public class StudentMain {

	public static void main(String[] args) {
//		Student s = new Student();
//		s.name = "홍길동";
//		s.ban = 1;
//		s.no = 1;
//		s.kor = 100;
//		s.eng = 60;
//		s.math = 76;
//		
//		System.out.println("이름: " + s.name);
//		System.out.println("총점: " + s.getTotal());
////		System.out.println("평균: " + s.getAverage());
//		System.out.println("평균: " + String.format("%.1f", s.getAverage()));
		
		Student s = new Student("홍길동",1,1,100,60,76);
		System.out.println(s.info());
		
	}

}
