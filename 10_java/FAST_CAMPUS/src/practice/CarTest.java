package practice;

import java.util.ArrayList;

public class CarTest {

	public static void main(String[] args) {
		
		ArrayList<Car> carList = new ArrayList<Car>();
		
//		Car sCar = new Sonata(); 
//		Car grCar = new Grandeur(); 
//		Car aCar = new Avante(); 
//		Car geCar = new Genesis(); 
		
		carList.add(new Sonata());
		carList.add(new Grandeur());
		carList.add(new Avante());
		carList.add(new Genesis());
		
		for(Car car : carList) {
			car.run();
		}
	}

}
