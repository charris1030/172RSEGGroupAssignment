package com.medfileupload.service;

import com.medfileupload.model.Image;
import com.medfileupload.model.User;

import java.util.List;

public interface UserService {
    void save(User user);
    User findByUsername(String username);
    void save(Image image);
    Image findImgByUsername(String username);
}
