package ru.homework.cars.server.crud.rest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Service;
import ru.homework.cars.server.dao.AbstractDAOImpl;
import ru.homework.cars.server.data.AbstractEntity;
import ru.homework.cars.server.crud.rest.service.interfaces.ClientService;

import java.util.List;

@Service
public class ClientServiceImpl implements ClientService {
    private ApplicationContext applicationContext = new AnnotationConfigApplicationContext("ru.homework.cars.server.dao.config.DAOConfig.class");


    @Override
    public Integer create(AbstractEntity abstractDataClass, String name) throws Throwable {
        int ret = 0;
        if (abstractDataClass.getClass().equals(AbstractEntity.class)) {
            try {
                AbstractEntity abstractEntity = abstractDataClass;
                AbstractDAOImpl abstractDAOImpl = (AbstractDAOImpl) applicationContext.getBean(name);
                ret = abstractDAOImpl.saveDataGetId(abstractEntity);
            } catch (Throwable throwable) {
                throw new Throwable(throwable);
            }

        }
        return ret;
    }

    @Override
    public List<AbstractEntity> getAll(String name) throws Exception {
        try {
            AbstractDAOImpl abstractDAOImpl = (AbstractDAOImpl) applicationContext.getBean(name);
            return abstractDAOImpl.getAll(applicationContext.getBean(name).getClass());
        } catch (Exception e) {
            throw new Exception("Ошибка получения сущностей! " + name + " " + e);
        }
    }

    @Override
    public AbstractEntity get(String name, Integer id) throws Exception {
        try {
            AbstractDAOImpl abstractDAOImpl = (AbstractDAOImpl) applicationContext.getBean(name);
            return abstractDAOImpl.getDataById(id, applicationContext.getBean(name).getClass());
        } catch (Exception throwable) {
            throw new Exception("Ошибка получения сущности! " + name + " " + id + throwable);
        }
    }

    @Override
    public void update(AbstractEntity abstractDataClass, String name) throws Exception {
        try {
            AbstractDAOImpl abstractDAOImpl = (AbstractDAOImpl) applicationContext.getBean(name);
            abstractDAOImpl.update(abstractDataClass);
        } catch (Exception e) {
            throw new Exception("Ошибка изменения сущности " + abstractDataClass.getClass().getName());
        }
    }

    @Override
    public void delete(AbstractEntity abstractDataClass, String name, int id) throws Throwable {
        try {
            Class aClass = applicationContext.getBean(name).getClass();
            AbstractDAOImpl abstractDAOImpl = (AbstractDAOImpl) applicationContext.getBean(name);
            abstractDAOImpl.deleteById(id, aClass);
        } catch (Exception e) {
            throw new Exception("Ошибка удаления сущности " + name + " " + e);
        }
    }
}
