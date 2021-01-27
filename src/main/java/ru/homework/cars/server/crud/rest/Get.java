package ru.homework.cars.server.crud.rest;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import lombok.extern.log4j.Log4j;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import ru.homework.cars.server.dao.AbstractDAOClass;
import ru.homework.cars.server.data.AbstractEntity;

import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping(value = "/get")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE)
@RestController
public class Get {
    private static ApplicationContext applicationContext = new AnnotationConfigApplicationContext("ru.homework.cars.server.data.classes");
    @RequestMapping(value ="/all/{name}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public List<AbstractEntity> getAll(@PathVariable String name) throws Exception {
        try {
            AbstractDAOClass abstractDAOClass  = (AbstractDAOClass) applicationContext.getBean(name);
            return abstractDAOClass.getAll(applicationContext.getBean(name).getClass());
        }catch (Exception e){
            throw new  Exception("Ошибка получения сущностей! "+name+" "+e);
        }
    }

    @RequestMapping(value ="/id/{id}/{name}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public AbstractEntity getAll(@PathVariable String name, @PathVariable Integer id) throws Exception {
        try{
            AbstractDAOClass abstractDAOClass  = (AbstractDAOClass) applicationContext.getBean(name);
            return abstractDAOClass.getDataById(id,applicationContext.getBean(name).getClass());
        } catch (Exception throwable){
            throw new  Exception("Ошибка получения сущности! "+name+" "+id+throwable);
        }
    }
}
