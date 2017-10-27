package com.snr.aop.spring;

import java.lang.reflect.Method;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.aop.AfterReturningAdvice;
import org.springframework.aop.MethodBeforeAdvice;

public class AfterHandler implements AfterReturningAdvice  {

	
	private Log log = LogFactory.getLog(this.getClass());
	
	
	@Override
	public void afterReturning(Object returnValue, Method method, Object[] args, Object target) throws Throwable {
		
		
	System.out.println("The method "+ method.getName() + "() 호출 후 반환 된 값 : " + returnValue);
		
		
	}

	
		
	}



