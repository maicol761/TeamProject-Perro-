package com.petshop.beauty.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class PointcutCommon {
	
	@Pointcut("execution(* com.petshop.beauty..*Impl.*(..))")
	public void allPointcut() { }
	
	@Pointcut("execution(* com.petshop.beauty..*Impl.get*(..))")
	public void getPointcut() { }

}
