package com.snr.aop;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class Program {

	public static void main(String[] args) {
		Calculator origin = new NewlecCalculator();
		
		// proxy를 생성해 실제 주업무 로직을 위임
		Calculator cal = (Calculator) Proxy.newProxyInstance(
					NewlecCalculator.class.getClassLoader(), 
						new Class[] {Calculator.class}, 
						new InvocationHandler() {
							
							@Override
							public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
								
								System.out.println("보조업무");

								Object result = method.invoke(origin, args);
								
								return result;
							}
						});
		
		int data = cal.add(3, 4);
		
		System.out.println(data);
		
	}

}
