package ru.homework.cars.server.dao;

import ru.homework.cars.server.dao.interfaces.AbstractDaoInterface;
import ru.homework.cars.server.data.AbstractEntity;

import java.util.List;

public class AbstractDAOClass implements AbstractDaoInterface {

    @Override
    public void save(AbstractEntity data) throws Exception {

    }

    @Override
    public int saveDataGetId(AbstractEntity data) throws Exception {
        return 0;
    }

    @Override
    public List<AbstractEntity> getAll(Class aClass) throws Exception {
        return null;
    }

    @Override
    public AbstractEntity getDataById(int id, Class aClass) throws Exception {
        return null;
    }

    @Override
    public void deleteById(int id, Class aClass) throws Exception {

    }

    @Override
    public void update(AbstractEntity data) throws Exception {

    }
}
