package algorithm;

public class ex03 {
	public static void insertionSort(int[] arr, int count) {
		int i = 0;
		int j = 0;
		int temp = 0;
		
		for(i = 1; i < count; i++) {
			temp = arr[i];
			j = i;
			while((j>0) && arr[j-1] > temp) {
				arr[j] = arr[j-1];
				j = j - 1;
			}
			arr[j] = temp;
			
			System.out.println("반복 - " + i);
			printsort(arr, count);
		}
	}
	
	public static void printsort(int value[], int count) {
		int i = 0;
		for()
		
	}
	

	public static void main(String[] args) {
		
		int[] arr = {80, 50, 70, 10, 60, 20, 40, 30 };
		
		insertionSort(arr, 8);

	}

}
