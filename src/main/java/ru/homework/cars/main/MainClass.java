package ru.homework.cars.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;

@SpringBootApplication
@ComponentScan(basePackages = "ru.homework.cars.server.crud.rest")
public class MainClass {
    private static ApplicationContext applicationContext;
    public static void main(String[] args) {
        applicationContext = SpringApplication.run(MainClass.class,args);
        for (String beanName : applicationContext.getBeanDefinitionNames()) {
            System.out.println(beanName);
        }

    }
    private static void checkBeansPresence(String... beans) {
        for (String beanName : beans) {
            System.out.println("Is " + beanName + " in ApplicationContext: " +
                    applicationContext.containsBean(beanName));
        }
    }
}
