package polymorphism3;

public class TVUser {

	public static void main(String[] args) {
		BeanFactory factory = new BeanFactory();
		
		// SamsungTV, LgTV 사용
		//TV tv = (TV) factory.getBean("lg");
		
		TV tv = (TV) factory.getBean(args[0]);
		tv.powerOn();
		tv.volumeUp();
		tv.volumeDown();
		tv.powerOff();

		
	}

}
