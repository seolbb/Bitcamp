package di_annotation_xml;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class LgTV implements TV {
	@Autowired
	private Speaker speaker;
	
	public LgTV() {
		System.out.println(">>LgTV 객체 생성");
	}

	@Override
	public void powerOn() {
		System.out.println("LgTV - 전원ON");
	}
	@Override
	public void powerOff() {
		System.out.println("LgTV - 전원OFF");
	}
	@Override
	public void volumeUp() {
		System.out.println("LgTV - 소리크게~~");
		speaker.volumnUp();
	}
	@Override
	public void volumeDown() {
		System.out.println("LgTV - 전원ON");
		speaker.volumnDown();
	}
	
	//------------------------
	public void initMethod() {
		System.out.println(">> LgTV - initMethod() 실행");
	}
	public void destroyMethod() {
		System.out.println(">> LgTV - destroyMethod() 실행");
	}
	
}
