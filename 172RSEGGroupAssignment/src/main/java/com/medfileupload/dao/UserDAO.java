package com.medfileupload.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.medfileupload.model.Image;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.medfileupload.repository.User;

@Transactional
@Repository
public class UserDAO implements IUserDAO {
    @PersistenceContext
    private EntityManager entityManager;
    @Override
    public User getUserById(int Id) {
        return entityManager.find(User.class, Id);
    }
    @SuppressWarnings("unchecked")
    @Override
    public List<User> getAllUsers() {
        String hql = "SELECT * FROM User";
        return (List<User>) entityManager.createQuery(hql).getResultList();
    }
    @Override
    public void addUser(User user) {
        entityManager.persist(user);
    }
    @Override
    public boolean userExists(String username) {
        String hql = "SELECT username FROM User WHERE username = ?";
        int count = entityManager.createQuery(hql).setParameter(1, username)
               .getResultList().size();
        return count > 0 ? true : false;
    }

    @Override
    public void addImage(Image image) {
        entityManager.persist(image);
    }

    @Override
    public List<Image> getAllImages() {
        String hql = "SELECT * FROM stored_images";
        return (List<Image>) entityManager.createQuery(hql).getResultList();
    }
}