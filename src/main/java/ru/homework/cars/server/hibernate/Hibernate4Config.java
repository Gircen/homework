package ru.homework.cars.server.hibernate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import ru.homework.cars.server.dao.AbstractDAOClass;

@Configuration
@EnableTransactionManagement
public class Hibernate4Config {

    @Bean(name = "abstractDao")
    AbstractDAOClass abstractDAOClass(LocalSessionFactoryBean localSessionFactoryBean){
        return new AbstractDAOClass();
    }
    @Bean(name ="localSessionFactoryBean")
    LocalSessionFactoryBean localSessionFactoryBean(){
        LocalSessionFactoryBean sessionFactoryBean = new LocalSessionFactoryBean();
        sessionFactoryBean.setDataSource(dataSource());
        sessionFactoryBean.setPackagesToScan();
        return sessionFactoryBean;
    }

    @Bean(name = "dataSource")
    DriverManagerDataSource dataSource(){
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setUrl("jdbc:postgresql://localhost:5432/homework");
        dataSource.setDriverClassName("org.postgresql.Driver");
        dataSource.setUsername("postgres");
        dataSource.setPassword("postgres");
        return dataSource;
    }
}
