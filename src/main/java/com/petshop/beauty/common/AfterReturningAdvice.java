package com.petshop.beauty.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Service;

@Aspect
@Service
public class AfterReturningAdvice {

	@AfterReturning(pointcut="PointcutCommon.getPointcut()",returning="returnObj")
	public void afterLog(JoinPoint jp,Object returnObj) {
		String method = jp.getSignature().getName();
		
		System.out.printf("[사후처리] 메소드명: %s 리턴값: %s \n",
				method,returnObj.toString());
		
	}
}
