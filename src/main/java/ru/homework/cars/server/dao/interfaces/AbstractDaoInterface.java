package ru.homework.cars.server.dao.interfaces;

import ru.homework.cars.server.data.AbstractEntity;

import java.util.List;

public interface AbstractDaoInterface {
    public void save(AbstractEntity data) throws Exception;
    public int saveDataGetId(AbstractEntity data) throws Exception;
    public List<AbstractEntity> getAll(Class aClass) throws Exception;
    public AbstractEntity getDataById(int id,Class aClass) throws Exception;
    public void deleteById(int id,Class aClass) throws Exception;
    public void update(AbstractEntity data) throws Exception;

}
