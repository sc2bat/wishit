package com.example.demo;

public class TestforTest {

	public static void main(String[] args) {
		
		String str1 = "22200.30.33";
		String str2 = "22200.30.33";
		
		System.out.println("start");
		System.out.println(str1.replace(".", ""));
		System.out.println(str2.substring(0, 4));

		String str3 = "2022-05-09 00:00:00";
		System.out.println(str3.replace(".", "").replace("-", "").substring(0, 8));
		
	}

}
