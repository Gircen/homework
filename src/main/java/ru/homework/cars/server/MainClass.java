package ru.homework.cars.server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScans;

@SpringBootApplication(scanBasePackages = "ru.homework.cars.server")
public class MainClass {

    public static void main(String[] args) {
        SpringApplication.run(MainClass.class, args);


    }

}
