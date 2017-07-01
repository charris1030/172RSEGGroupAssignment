package com.medfileupload.service;

import com.medfileupload.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
