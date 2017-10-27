package com.snr.aop.spring;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;


public class Program {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Calculator origin = new NewlecCalculator();
		
		//자바로만 구현하는 방법
		//proxy를 생성해 실제 주업무 로직을 위임.
		Calculator cal = (Calculator)Proxy.newProxyInstance(NewlecCalculator.class.getClassLoader(), 
				new Class[] {Calculator.class}, //동일한 인터페이스를 넘겨받는다.
				new InvocationHandler() {
				//보조 업무의 구현, 따로 클래스를 정의해서 만들어도 됨.
			@Override// Method method= 실제 존재하는 함수를 호출
			public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
				System.out.println("사전 처리 업무");
				Object result = method.invoke(origin, args);//가지고 있는 함수를 호출 원래의 객체를 넘겨준다. 그리고 파라미터를 넘겨받음
				return result;
			}
		});
		
		
		int data = cal.add(3, 4);
		//int data = proxy.add(3,4);		
		System.out.println(data);
		
	}

}
