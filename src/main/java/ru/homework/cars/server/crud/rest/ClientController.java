package ru.homework.cars.server.crud.rest;

//import com.fasterxml.jackson.annotation.JsonAutoDetect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
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

    @PostMapping(value = "/add/{name}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public Integer create(@RequestBody AbstractEntity abstractDataClass, @PathVariable String name) throws Throwable {
        return clientService.create(abstractDataClass,name);
    }
    @GetMapping(value = "/all/{name}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public List<AbstractEntity> getAll(@PathVariable String name) throws Exception {
        return clientService.getAll(name);
    }

    @GetMapping(value = "/id/{id}/{name}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public AbstractEntity getAll(@PathVariable String name, @PathVariable int id) throws Exception {
        return clientService.getAll(name,id);
    }
    @PutMapping(value = "/{name}",  produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public void update(@RequestBody AbstractEntity abstractDataClass, @PathVariable String name) throws Exception {
        clientService.update(abstractDataClass,name);
    }
    @DeleteMapping(value = "/{name}/id", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public void delete(@RequestBody AbstractEntity abstractDataClass, @PathVariable String name, @PathVariable int id) throws Throwable {
        clientService.delete(abstractDataClass,name,id);
    }
}
