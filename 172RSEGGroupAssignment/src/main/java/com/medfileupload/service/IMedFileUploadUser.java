package com.medfileupload.service;

import com.medfileupload.repository.User;

import java.util.List;

/**
 * Created by Chris on 7/5/2017.
 */
public interface IMedFileUploadUser {

    List<User> getAllUsers();
    User getUserById(int Id);
    boolean addUser(User user);
}


