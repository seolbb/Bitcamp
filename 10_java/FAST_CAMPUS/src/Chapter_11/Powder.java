package Chapter_11;

public class Powder extends Meterial {

	public String toString() {
		return "재료는 Powder입니다";
	}

	@Override
	public void doPrint() {
		System.out.println("Powder로 프린팅 합니다");
	}
}
