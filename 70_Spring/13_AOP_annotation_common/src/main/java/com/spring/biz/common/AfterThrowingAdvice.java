package com.spring.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class AfterThrowingAdvice {

	@AfterThrowing(pointcut = "PointcutCommon.allPointcut()", throwing = "exceptionObj")
	public void exceptionLog(JoinPoint jp, Exception exceptionObj) {
		System.out.println("[후처리-AfterThrowingAdvice.exceptionLog] "
				+ " 로직 수행중 예외발생시 로그 - " + exceptionObj);
	}
}



