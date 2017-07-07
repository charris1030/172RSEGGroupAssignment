package com.medfileupload.dao;

import java.util.List;

import com.medfileupload.model.Image;
import com.medfileupload.repository.User;

public interface IUserDAO {
    List<User> getAllUsers();
    List<Image> getAllImages();
    User getUserById(int Id);
    void addUser(User user);
    void addImage(Image image);
    boolean userExists(String username);
}