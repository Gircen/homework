package ru.homework.cars.server.crud.rest;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import lombok.extern.log4j.Log4j;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import ru.homework.cars.server.dao.AbstractDAOClass;
import ru.homework.cars.server.data.AbstractEntity;

@CrossOrigin(origins = "*")
@RequestMapping(value = "/update")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE)
@RestController
public class Update {
    private static ApplicationContext applicationContext = new AnnotationConfigApplicationContext("ru.homework.cars.server.data.classes");
    @RequestMapping(value ="/{name}", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public void update(@RequestBody AbstractEntity abstractDataClass, @PathVariable String name) throws Exception
    {
        try{
            AbstractDAOClass abstractDAOClass  = (AbstractDAOClass) applicationContext.getBean(name);
            abstractDAOClass.update(abstractDataClass);
        }catch (Exception e){
            throw new Exception("Ошибка изменения сущности "+abstractDataClass.getClass().getName());
        }
    }
}
