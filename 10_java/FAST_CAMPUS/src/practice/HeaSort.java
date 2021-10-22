package practice;

public class HeaSort implements Sort{

	@Override
	public void ascending(int[] arr) {
		System.out.println("HeaSort ascending");
	}

	@Override
	public void descending(int[] arr) {
		System.out.println("HeaSort descending");
	}

	@Override
	public void description() {
		Sort.super.description();
		System.out.println("HeaSort입니다");
	}
	
	

}
