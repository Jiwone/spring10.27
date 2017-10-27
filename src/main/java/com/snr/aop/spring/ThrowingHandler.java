package com.snr.aop.spring;

import java.lang.reflect.Method;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.aop.AfterReturningAdvice;
import org.springframework.aop.MethodBeforeAdvice;
import org.springframework.aop.ThrowsAdvice;

public class ThrowingHandler implements ThrowsAdvice  {

	public void afterThrowing(ArithmeticException e) throws Throwable{
		
		System.out.println("예외 발생 : " + e.getMessage());
	}

	
		
	}



