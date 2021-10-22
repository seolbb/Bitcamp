package chapter6;

public class ShuffleMain {

	public static void main(String[] args) {

		int[] original = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
		System.out.println(java.util.Arrays.toString(original));
		int[] result = Shuffle(original);
		System.out.println(java.util.Arrays.toString(result));

	}
	
	
	public static int[] Shuffle(int[] arr) {
		if (arr == null)
			return arr;

		for (int x = 0; x < arr.length * 2; x++) {
			int i = (int) (Math.random() * arr.length);
			int j = (int) (Math.random() * arr.length);

			int tmp = arr[i];
			arr[i] = arr[j];
			arr[j] = tmp;

		}

		return arr;
	}


}
