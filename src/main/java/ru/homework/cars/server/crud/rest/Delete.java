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
@RestController
@RequestMapping(value = "/delete")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class Delete {
    private static ApplicationContext applicationContext = new AnnotationConfigApplicationContext("ru.homework.cars.server.data.classes");
    @RequestMapping(value = "/{name}/id",method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public void delete(@RequestBody AbstractEntity abstractDataClass, @PathVariable String name,@PathVariable int id) throws Throwable{
        try {
            Class aClass = applicationContext.getBean(name).getClass();
            AbstractDAOClass abstractDAOClass  =  (AbstractDAOClass) applicationContext.getBean(name);
            abstractDAOClass.deleteById(id,aClass);
        }catch (Exception e){
            throw new Exception("Ошибка удаления сущности "+name+" "+e);
        }
    }
}
