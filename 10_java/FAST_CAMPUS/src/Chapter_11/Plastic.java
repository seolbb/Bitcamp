package Chapter_11;

public class Plastic extends Meterial {

	public String toString() {
		return "재료는 Plastic입니다";
	}

	@Override
	public void doPrint() {
		System.out.println("Plastic로 프린팅 합니다");
	}
}
