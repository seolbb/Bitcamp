package class1.basic;

public class Ex03_method extends Object{
//	public class Ex03_method extends Object{
	// java.lang.Object --> 모든 클래스의 조상 클래스
// 오브젝트부터 파생되어서 만들어진 클래스임 (보통 extends Object 는 생락되어짐)
	public static void main(String[] args) {
		Ex03_method ex03 = new Ex03_method();
		int num1 = 200;
		int num2 = 100;
		int sum = 0;
		sum = ex03.add(num1, num2);
		System.out.println("sum : " + sum);
		
		System.out.println("sub : " + ex03.sub(num1, num2));
		System.out.println("mul : " + ex03.mul(num1, num2));
		System.out.println("div : " + ex03.div(num1, num2));
	}
	
	int add(int a, int b) {
//		int result = 0;
//		result = a + b;
//		return result;
		return  a + b;
	}
	
	int sub(int a, int b) {
		return a - b;
	}
	
	int mul(int a, int b) {
		return a * b;
	}
	
	int div(int a, int b) {
		return a / b;
	}
}
