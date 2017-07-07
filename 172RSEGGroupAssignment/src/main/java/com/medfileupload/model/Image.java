package com.medfileupload.model;

import javax.persistence.*;
import java.sql.Blob;
import java.sql.Date;
import java.util.Set;

@Entity
@Table(name = "stored_images")
public class Image {
    private Long id;
    private String username;
    private Blob image;
    private String first_name;
    private String last_name;
    private String address;
    private String city;
    private String state;
    private String zip;
    private Date create_ts;

    //private Set<Image> images;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Blob getImage() {
        return image;
    }

    public void setImage(Blob image) {
        this.image = image;
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

    public void setCreate_ts (String Date) {
        this.create_ts = create_ts;
    }

    //@ManyToMany(mappedBy = "stored_images")
    //public Set<Image> getImages() {
    //    return images;
    //}
    //public void setImages(Set<Image> images) {
    //    this.images = images;
    //}

}
