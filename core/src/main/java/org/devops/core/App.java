package org.devops.core;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class App {
	public static void main(String[] args) throws InterruptedException {
		System.out.println("Create thread pool!");
		ExecutorService service = Executors.newFixedThreadPool(10);
		service.awaitTermination(1000, TimeUnit.DAYS);
	}
}
