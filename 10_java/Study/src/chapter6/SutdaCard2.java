package chapter6;

class SutdaCard2 {
	int num;
	boolean isKwang;

	SutdaCard2() {
		this(1, true);
	}

	SutdaCard2(int num, boolean isKwang) {
		this.num = num;
		this.isKwang = isKwang;
	}

	// info()대신 Object클래스의 toString()을 오버라이딩했다.
	public String toString() {
		return num + (isKwang ? "K" : "");
	}
}