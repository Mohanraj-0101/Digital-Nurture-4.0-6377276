package com.library.main;

import com.library.service.BookService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LibraryApp {
    public static void main(String[] args) {
        // Load the Spring container from XML
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");

        // Get the service bean
        BookService bookService = context.getBean("bookService", BookService.class);

        // Use the service
        bookService.addBook("Atomic Habits");
    }
}
