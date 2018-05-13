package com.project.model;

import org.springframework.stereotype.Component;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.List;

@Entity
@Component
@Table(name="university_career")
public class UniversityCareerEntity implements Serializable {

    public UniversityCareerEntity() {
        super();
    }

    public UniversityCareerEntity(List<AttempEntity> attemps_list) {
        this.attemps_list = attemps_list;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @NotNull
    @Column(name="id_career", nullable=false)
    private long id_career;

    @OneToMany(mappedBy = "career")
    private List<AttempEntity> attemps_list;

    public long getId_career() {
        return id_career;
    }

    public void setId_career(long id_career) {
        this.id_career = id_career;
    }

    public List<AttempEntity> getAttemps_list() {
        return attemps_list;
    }

    public void setAttemps_list(List<AttempEntity> attemps_list) {
        this.attemps_list = attemps_list;
    }
}
