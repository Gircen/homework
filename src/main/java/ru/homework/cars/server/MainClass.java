package ru.homework.cars.server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.Collection;

/*
* Приложение должно реализовывать CRUD для сущьностей, находящихся в пакете classes,
* так же оно должно оно выводит веб приложение для изменения отображения данных.
* На данный момент реализован круд веб в веб приложении неподключены ресурсы, но индекс можно открыть в браузере (напрямую)
* и увидеть результат работы, так же в приложении нет профилей так что измение подключения к БД можно произвести
* только напрямую меняя код в классе HibernateConfig.
* Скрипт создания таблиц в resources/sql/create.sql скрипт создаст схему homework после чего crud сможет работать с ББ
* (естественно после настройки)
*
* */
@SpringBootApplication
public class MainClass {

    public static void main(String[] args) {
        SpringApplication.run(MainClass.class, args);


    }

}
