package com.medfileupload.repository;

import javax.persistence.Entity;
import javax.persistence.Table;

import java.util.Date;

/**
 * Created by Chris on 7/5/2017.
 */
//@Entity
@Table(name="MED_FILE_USER")
public class User{

    Long id;
    String username;
    String first_name;
    String last_name;
    String address;
    String state;
    String zip;
    String password;
    Date create_ts;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String username) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress (String address) {
        this.address = address;
    }

    public String getState() {
        return state;
    }

    public void setState (String state) {
        this.state = state;
    }

    public String getZip() {
        return zip;
    }

    public void setZip (String zip) {
        this.zip = zip;
    }

    public Date getCreate_ts() {
        return create_ts;
    }

    public void setCreate_ts (String zip) {
        this.create_ts = create_ts;
    }

}