package practice;

public class StudentTest {

	public static void main(String[] args) {
		
		Student stu1 = new Student(1001, "Lee");
		Student stu2 = new Student(1002, "Kim");
		Student stu3 = new Student(1003, "Cho");
		
		stu1.addBook("태백산맥1", "아무개");
		stu1.addBook("태백산맥2", "아무개");
		
		stu2.addBook("토지1", "어쩌구");
		stu2.addBook("토지2", "어쩌구");
		stu2.addBook("토지3", "어쩌구");
		
		stu3.addBook("해리포터1", "해리");
		stu3.addBook("해리포터2", "해리");
		stu3.addBook("해리포터3", "해리");
		stu3.addBook("해리포터4", "해리");
		stu3.addBook("해리포터5", "해리");
		stu3.addBook("해리포터6", "해리");
		
		stu1.showInfo();
		stu2.showInfo();
		stu3.showInfo();
		

	}

}
