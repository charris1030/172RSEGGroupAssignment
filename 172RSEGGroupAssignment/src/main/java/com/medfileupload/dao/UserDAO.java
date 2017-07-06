package com.medfileupload.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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
        String hql = "SELECT id, create_ts, first_name, last_name, address, state, zip FROM MED_FILE_USER";
        return (List<User>) entityManager.createQuery(hql).getResultList();
    }
    @Override
    public void addUser(User user) {
        entityManager.persist(user);
    }
    @Override
    public boolean userExists(String username) {
        String hql = "SELECT username FROM MED_FILE_USER WHERE username = ?";
        int count = entityManager.createQuery(hql).setParameter(1, username)
               .getResultList().size();
        return count > 0 ? true : false;
    }
}