package ru.homework.cars.server.crud.rest.service.interfaces;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import ru.homework.cars.server.data.AbstractEntity;

import java.util.List;

public interface ClientService {
    public Integer create(@RequestBody AbstractEntity abstractDataClass, @PathVariable String name) throws Throwable ;
    public List<AbstractEntity> getAll(@PathVariable String name) throws Exception ;
    public AbstractEntity get(@PathVariable String name, @PathVariable Integer id) throws Exception;
    public void update( AbstractEntity abstractDataClass,String name) throws Exception;
    public void delete( AbstractEntity abstractDataClass, String name, int id) throws Throwable ;
}
