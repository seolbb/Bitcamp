package algorithm;
//여러 개의 수가 배열에 있을 때 그 중 가장 큰 값과 가장 작은 값을 찾는다.
//배열의 몇 번째에 있는지 순서를 찾는다.
//반복문을 한번만 사용하여 문제를 해결한다.
//수의 예 : [10, 55, 23, 2, 79, 101, 16, 82, 30, 45]
public class ex01 {
	public static void main(String[] args) {
		
		int[] num = {10, 55, 23, 2, 79, 101, 16, 82, 30, 45};
		
//		배열에 있는 수 중 맨 처음에 있는 값을 max와 min으로 가정하고, 배열의 마지막 숫자까지 비교하면서 더 큰 수나 더 작은 수가 나올때 max와 min의 값을 바꾸도록 한다.
//		그때의 위치를 변수에 저장한다.

		int max = num[0];
		int min = num[0];
		int maxPos = 0;
		int minPos = 0;
		
		for(int i = 1; i < num.length; i++) {
			if(min > num[i]) {
				min = num[i];
				minPos = i+1;
			}
			if(max < num[i]) {
				max = num[i];
				maxPos = i+1;
			}
		}
		System.out.println("min : " + min + ", minPos : " + minPos);
		System.out.println("max : " + max + ", maxPos : " + maxPos);
		
	}

}
