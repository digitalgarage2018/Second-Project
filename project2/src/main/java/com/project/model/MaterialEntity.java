package com.project.model;

import org.springframework.stereotype.Component;

import java.io.Serializable;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Component
@Table(name="material")
public class MaterialEntity implements Serializable
{
    private static final long serialVersionUID = 8490877745613382422L;
    
    public static final String NOTE  = "N";
    public static final String VIDEO = "V";

    public MaterialEntity() {
        super();
    }

    public MaterialEntity( String file, String type )
    {
        this.file = file;
        this.type = type;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @NotNull
    @Column(name="id_material", nullable=false)
    private long id_material;
    
    @Column(name="file")
    private String file;
    
    @Column(name="type")
    private String type;



    public long getId_material() {
        return id_material;
    }

    public void setId_material(long id_material) {
        this.id_material = id_material;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }
    
    public void setType( String type ) {
        this.type = type;
    }
    
    public String getType() {
        return type;
    }

}
