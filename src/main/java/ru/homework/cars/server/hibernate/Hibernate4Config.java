package ru.homework.cars.server.hibernate;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import ru.homework.cars.server.dao.AbstractDAOImpl;

import java.util.Properties;

@Configuration
@EnableTransactionManagement
public class Hibernate4Config {

    @Bean(name = "abstractDao")
    AbstractDAOImpl abstractDAOClass() {
        return new AbstractDAOImpl();
    }

    @Bean(name = "localSessionFactoryBean")
    LocalSessionFactoryBean localSessionFactoryBean() {
        LocalSessionFactoryBean sessionFactoryBean = new LocalSessionFactoryBean();
        Properties properties = new Properties();
        properties.setProperty("hibernate.dialect","org.hibernate.dialect.PostgreSQL9Dialect");
        properties.setProperty("hibernate.temp.use_jdbc_metadata_defaults","false");
        sessionFactoryBean.setHibernateProperties(properties);
        sessionFactoryBean.setDataSource(dataSource());
        sessionFactoryBean.setPackagesToScan("ru.homework.cars.server.data");
        return sessionFactoryBean;
    }

    DriverManagerDataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setUrl("jdbc:postgresql://localhost:5432/homework");
        dataSource.setDriverClassName("org.postgresql.Driver");
        dataSource.setUsername("postgres");
        dataSource.setPassword("12345");
        return dataSource;
    }
}
