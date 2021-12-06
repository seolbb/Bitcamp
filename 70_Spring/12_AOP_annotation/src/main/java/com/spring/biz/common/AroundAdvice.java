package com.spring.biz.common;

import org.aspectj.lang.ProceedingJoinPoint;

//(실습) AOP 관련 어노테이션 설정
//@Aspect, @Pointcut, @Around
public class AroundAdvice {

	public Object aroundLog(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("[Around BEFORE] 실행전 로그");
		Object returnObj = pjp.proceed();
		System.out.println("[Around BEFORE] 실행후 로그");
		
		return returnObj;
	}
	
}
