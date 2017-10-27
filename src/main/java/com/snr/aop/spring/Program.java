package com.snr.aop.spring;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;


public class Program {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Calculator origin = new NewlecCalculator();
		
		//�ڹٷθ� �����ϴ� ���
		//proxy�� ������ ���� �־��� ������ ����.
		Calculator cal = (Calculator)Proxy.newProxyInstance(NewlecCalculator.class.getClassLoader(), 
				new Class[] {Calculator.class}, //������ �������̽��� �Ѱܹ޴´�.
				new InvocationHandler() {
				//���� ������ ����, ���� Ŭ������ �����ؼ� ���� ��.
			@Override// Method method= ���� �����ϴ� �Լ��� ȣ��
			public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
				System.out.println("���� ó�� ����");
				Object result = method.invoke(origin, args);//������ �ִ� �Լ��� ȣ�� ������ ��ü�� �Ѱ��ش�. �׸��� �Ķ���͸� �Ѱܹ���
				return result;
			}
		});
		
		
		int data = cal.add(3, 4);
		//int data = proxy.add(3,4);		
		System.out.println(data);
		
	}

}
