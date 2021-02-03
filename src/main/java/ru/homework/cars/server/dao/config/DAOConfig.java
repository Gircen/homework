package ru.homework.cars.server.dao.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScans;
import org.springframework.context.annotation.Configuration;
import ru.homework.cars.server.dao.AbstractDAOImpl;

@Configuration
public class DAOConfig {

    @Bean(name = "abstractDao")
    AbstractDAOImpl abstractDAOClass() {
        return new AbstractDAOImpl();
    }

}
