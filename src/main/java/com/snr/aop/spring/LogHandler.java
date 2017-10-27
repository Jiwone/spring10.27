package com.snr.aop.spring;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

public class LogHandler implements MethodInterceptor {

	@Override
	public Object invoke(MethodInvocation method) throws Throwable {
		
		System.out.println("º¸Á¶");
		
		Object result = method.proceed();
		
		return result;
	}

}
