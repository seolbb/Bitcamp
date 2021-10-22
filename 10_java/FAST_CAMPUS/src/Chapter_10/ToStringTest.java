package Chapter_10;

class Book {
	String title;
	String author;

	public Book(String title, String author) {
		this.title = title;
		this.author = author;
	}

//	@Override
//	public String toString() {
//		return author + "," + title;
//	}
	
	public void bookInfo() {
		System.out.println(title + "," + author);
	}
	
}

public class ToStringTest {

	public static void main(String[] args) {

		Book book = new Book("토지", "박경리");
		
		System.out.println(book);
		
		book.bookInfo();
		
		
		String str = new String("토지");
		System.out.println(str);

	}

}