package com.xworkz.xworkz_loginModule.dao;

import com.xworkz.xworkz_loginModule.entity.LoginEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import java.util.List;

@Repository
public class LoginDAOImpl implements LoginDAO {

    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public boolean save(LoginEntity entity) {

        EntityManager em = entityManagerFactory.createEntityManager();

        try {
            EntityTransaction tx = em.getTransaction();
            tx.begin();

            em.persist(entity);

            tx.commit();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;

        } finally {
            em.close();
        }
    }

    @Override
    public LoginEntity getEmail(String email) {

        EntityManager em = entityManagerFactory.createEntityManager();

        try {
            Query query = em.createNamedQuery("findByEmail");
            query.setParameter("getEmail", email.toLowerCase());

            List<LoginEntity> list = query.getResultList();

            if (!list.isEmpty()) {
                return list.get(0);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }

        return null;
    }

    @Override
    public LoginEntity getPhoneNumber(String phoneNumber) {

        EntityManager em = entityManagerFactory.createEntityManager();

        try {
            Query query = em.createNamedQuery("findByPhoneNumber");
            query.setParameter("getPhoneNumber", phoneNumber);

            List<LoginEntity> list = query.getResultList();

            if (!list.isEmpty()) {
                return list.get(0);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }

        return null;
    }
    @Override
    public boolean update(LoginEntity entity) {

        EntityManager em = entityManagerFactory.createEntityManager();
        
        try {
            EntityTransaction tx = em.getTransaction();
            tx.begin();

            em.merge(entity);

            tx.commit();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }

        return false;
    }
}