package com.medfileupload.repository;

import com.medfileupload.model.Image;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by Chris on 7/6/2017.
 */
public interface ImageRepository extends JpaRepository<Image, Long> {
    Image findImgByUsername(String username);
}
