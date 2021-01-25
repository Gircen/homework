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
        int ret = 0;
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.persist(data);
        ret = data.getId();
        tx.commit();
        session.close();
        return ret;
    }

    @Override
    public List<AbstractEntity> getAll(Class aClass) throws Exception {
        List<AbstractEntity> data = null;
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        data = session.createCriteria(aClass).list();
        tx.commit();
        session.close();
        return data;
    }

    @Override
    public AbstractEntity getDataById(int id, Class aClass) throws Exception {

        AbstractEntity abstractDataClass = null;
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        abstractDataClass = (AbstractEntity) session.get(aClass,id);
        tx.commit();
        session.close();
        return null;
    }

    @Override
    public void deleteById(int id, Class aClass) throws Exception {
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.delete(session.load(aClass,id));
        tx.commit();
        session.close();
    }

    @Override
    public void update(AbstractEntity data) throws Exception {

    }
}
