package Chapter_07;

import java.util.ArrayList;

public class CustomerTest {

	public static void main(String[] args) {
		
//		Customer customerLee = new Customer();
//		customerLee.setCustomerName("이순신");
//		customerLee.setCustomerID(10010);
//		customerLee.bonusPoint = 1000;
//		System.out.println(customerLee.showCustomerInfo());
		
//		VIPCustomer customerKim = new VIPCustomer(10020, "김유신");
//		customerKim.setCustomerName("김유신");
//		customerKim.setCustomerID(10020);
//		customerKim.bonusPoint = 10000;
//		System.out.println(customerKim.showCustomerInfo());
//		
//		GoldCustomer customerSon = new GoldCustomer(10030, "손설빈");
//		customerSon.bonusPoint = 10000;
//		System.out.println(customerSon.showCustomerInfo());
		
		ArrayList<Customer> customerList = new ArrayList<Customer>();
		
		Customer cust1 = new Customer(1, "이순신");
		Customer cust2 = new Customer(2, "신사임당");
		Customer cust3 = new GoldCustomer(3, "홍길동");
		Customer cust4 = new GoldCustomer(4, "이율곡");
		Customer cust5 = new VIPCustomer(5, "김유신");
		
		customerList.add(cust1);
		customerList.add(cust2);
		customerList.add(cust3);
		customerList.add(cust4);
		customerList.add(cust5);
		
		for(Customer cust : customerList) {
			System.out.println(cust.showCustomerInfo());
		}
		
		for(Customer cust : customerList) {
			int cost = cust.calcPrice(10000);
			System.out.println(cust.getCustomerName() + "님이 " + cost + "원 지불하셨습니다");
			System.out.println(cust.getCustomerName() + "님의 현재 보너스 포인트는 " + cust.bonusPoint + "점 입니다.");
			
		}
		
		

	}

}
