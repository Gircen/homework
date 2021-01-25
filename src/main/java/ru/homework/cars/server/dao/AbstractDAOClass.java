package ru.homework.cars.server.dao;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import ru.homework.cars.server.dao.interfaces.AbstractDaoInterface;
import ru.homework.cars.server.data.AbstractEntity;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import java.util.List;
@Getter
@Setter
public class AbstractDAOClass implements AbstractDaoInterface {

    protected SessionFactory sessionFactory;
    @Override
    public void save(AbstractEntity data) throws Exception {
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.persist(data);
        tx.commit();
        session.close();

    }

    @Override
    public int saveDataGetId(AbstractEntity data) throws Exception {
        return 0;
    }

    @Override
    public List<AbstractEntity> getAll(Class aClass) throws Exception {
        List<AbstractEntity> data = null;


        Session session = this.sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        
        session.close();
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
