package com.medfileupload.service;

import com.medfileupload.dao.IUserDAO;
import com.medfileupload.repository.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Chris on 7/5/2017.
 */
@Service
public class MedFileUploadUser implements IMedFileUploadUser {

        @Autowired
        private IUserDAO userDAO;
        @Override
        public User getUserById(int Id) {
            User obj = userDAO.getUserById(Id);
            return obj;
        }
        @Override
        public List<User> getAllUsers(){
            return userDAO.getAllUsers();
        }
        @Override
        public synchronized boolean addUser(User user){
            if (userDAO.userExists(user.getUsername())) {
                return false;
            } else {
                userDAO.addUser(user);
                return true;
            }
    }
}