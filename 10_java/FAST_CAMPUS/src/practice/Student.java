package practice;

import java.util.ArrayList;

public class Student {

	int id;
	String name;
	ArrayList<Book> bookList = new ArrayList<Book>();

	public Student(int id, String name) {
		this.id = id;
		this.name = name;
	}
	
	public void addBook(String bookName, String author) {
		Book book = new Book();
		
		book.setAuthor(author);
		book.setBookName(bookName);
		bookList.add(book);
	}
	
	public void showInfo() {
		System.out.print(name + "학생이 읽은 책은 : ");
		
		for(Book b : bookList) {
			System.out.print(b.getBookName() + " ");
		}
		System.out.println("입니다");
		
	}

}
