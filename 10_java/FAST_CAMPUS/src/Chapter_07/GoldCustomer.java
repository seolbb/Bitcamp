package Chapter_07;

public class GoldCustomer extends Customer {

	double salesRatio;

	public GoldCustomer(int customerID, String customerName) {
		super(customerID, customerName);

		customerGrade = "GOlD";
		bonusRatio = 0.02;
		salesRatio = 0.1;
	}

	@Override
	public int calcPrice(int price) {
		bonusPoint += price * bonusRatio;
		return price - (int) (price * salesRatio);
	}

}
