package ru.homework.cars.server.crud.rest;

//import com.fasterxml.jackson.annotation.JsonAutoDetect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import ru.homework.cars.server.crud.rest.service.ClientServiceImpl;
import ru.homework.cars.server.data.AbstractEntity;
import ru.homework.cars.server.crud.rest.service.interfaces.ClientService;

import java.util.List;

@CrossOrigin(origins = "*")
@RestController
public class ClientController {

    private final ClientService clientService;
    @Autowired
    public  ClientController(ClientService clientService){
        this.clientService = clientService;
    }

    @PostMapping(value = "/add/{name}")
    public Integer create(@RequestBody AbstractEntity abstractDataClass, @PathVariable String name) throws Throwable {
        return clientService.create(abstractDataClass,name);
    }
    @GetMapping(value = "/all/{name}")
    public List<AbstractEntity> getAll(@PathVariable String name) throws Exception {
        return clientService.getAll(name);
    }

    @GetMapping(value = "/id/{id}/{name}")
    public AbstractEntity get(@PathVariable String name, @PathVariable int id) throws Exception {
        return clientService.get(name,id);
    }
    @PutMapping(value = "/{name}")
    public void update(@RequestBody AbstractEntity abstractDataClass, @PathVariable String name) throws Exception {
        clientService.update(abstractDataClass,name);
    }
    @DeleteMapping(value = "/{name}/id")
    public void delete(@RequestBody AbstractEntity abstractDataClass, @PathVariable String name, @PathVariable int id) throws Throwable {
        clientService.delete(abstractDataClass,name,id);
    }
}
