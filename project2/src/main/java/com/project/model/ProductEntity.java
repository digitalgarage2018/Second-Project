package com.project.model;

import org.hibernate.validator.constraints.NotEmpty;
import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table (name="PRODUCTS")
public class ProductEntity implements Serializable {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long product_id;

    @NotEmpty
    @Column(name="p_name", nullable=false)
    private String name;

    @NotEmpty
    @Column(name="p_description", nullable=false)
    private String description;

    @NotEmpty
    @Column(name="p_service", nullable=false)
    private String service;

    @NotEmpty
    @Column(name="p_image", nullable=false)
    private String image;

    @NotEmpty
    @Column(name="p_price", nullable=false)
    private int price;

    public long getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
