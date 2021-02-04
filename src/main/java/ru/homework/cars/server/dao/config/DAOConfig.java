package ru.homework.cars.server.dao.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import ru.homework.cars.server.dao.AbstractDAOImpl;
import ru.homework.cars.server.data.classes.*;

@Configuration
@Scope()
public class DAOConfig {

    @Bean(name = "abstractDao")
    AbstractDAOImpl abstractDAOClass() {
        return new AbstractDAOImpl();
    }

    @Bean(name = "body")
    Body body(){ return new Body(); }

    @Bean(name ="brand")
    Brand brand(){
        return new Brand();
    }

    @Bean(name ="cars")
    Cars cars(){
        return new Cars();
    }

    @Bean(name = "colours")
    Colours colours(){return new Colours();}

    @Bean(name = "drive")
    Drive drive(){return new Drive();}

    @Bean(name = "transmissioncar")
    TransmissionCar transmissionCar(){return new TransmissionCar();}

}
