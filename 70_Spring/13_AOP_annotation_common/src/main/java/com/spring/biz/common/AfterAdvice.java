package com.spring.biz.common;

//(실습) AOP 관련 어노테이션 설정
//@Aspect, @Pointcut, @After
public class AfterAdvice {

	public void afterLog() {
		System.out.println("[후처리-AfterAdvice.afterLog] 실행 후 로그(무조건)");
	}
}
