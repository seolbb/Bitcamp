package practice;

import java.io.IOException;

public class SortTest {

	public static void main(String[] args) throws IOException {
		
		System.out.println("정렬방식을 선택 하세요");
		System.out.println("B : BubbleSort");
		System.out.println("H : HeaSort");
		System.out.println("Q : QuickSort");
		
		int ch = System.in.read();
		Sort sort = null;
		
		if(ch == 'B' || ch == 'b') {
			sort = new BubbleSort();
		} else if (ch == 'H' || ch == 'h') {
			sort = new HeaSort();
		} else if (ch == 'Q' || ch == 'q') {
			sort = new QuickSort();
		}
		
		sort.ascending(null);
		sort.descending(null);
		sort.description();
	

	}

}
