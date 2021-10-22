package chapter6;

class SutdaCard {
	int num;
	boolean isKwang;
	
	public SutdaCard() {
		this.num = 1;
		this.isKwang = true;
	}
	
	public SutdaCard(int num, boolean isKwang) {
		this.num = num;
		this.isKwang = isKwang;
		
	}
	
	String info() {
		return num + (isKwang? "K" : "");
	
	}
	
	
	
	
}
