package com.medfileupload.service;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * Created by Chris on 7/2/2017.
 */

@ConfigurationProperties("storage")
public class StorageProperties {

    /**
     * Folder location for storing files
     */
    private String location = "upload-dir";

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

}

