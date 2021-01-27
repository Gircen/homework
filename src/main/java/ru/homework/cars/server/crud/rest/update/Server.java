package ru.homework.cars.server.crud.rest.update;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import lombok.extern.log4j.Log4j;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins = "*")
@RequestMapping(value = "/")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE)
@RestController
@Log4j
public class Server {
    private static ApplicationContext applicationContext = new AnnotationConfigApplicationContext("ru.homework.cars.server.data.classes");
}
