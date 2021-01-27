package ru.homework.cars.server.crud.rest.add;

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
@RequestMapping(value = "/")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
@Log4j
public class Server {
    private static ApplicationContext applicationContext = new AnnotationConfigApplicationContext("ru.homework.cars.server.data.classes");
    @RequestMapping(value = "/add/{name}",method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public Integer add(@RequestBody AbstractEntity abstractDataClass, @PathVariable String name) throws Throwable{
        int ret = 0;
        if(abstractDataClass.getClass().equals(AbstractEntity.class)){
            try {
                AbstractEntity abstractEntity = abstractDataClass;
                AbstractDAOClass abstractDAOClass  = (AbstractDAOClass) applicationContext.getBean(name);
                ret = abstractDAOClass.saveDataGetId(abstractEntity);
            }catch (Throwable throwable){
                throw new Throwable(throwable);
            }

        }
        return ret;
    }

}
