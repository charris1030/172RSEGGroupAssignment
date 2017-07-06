package com.medfileupload.dao;

import java.util.List;
import com.medfileupload.repository.User;

public interface IUserDAO {
    List<User> getAllUsers();
    User getUserById(int Id);
    void addUser(User user);
    boolean userExists(String username);
}