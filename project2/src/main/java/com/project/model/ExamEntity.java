package com.project.model;

import java.io.Serializable;
import java.util.List;
import java.util.Set;
import javax.persistence.*;


import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table (name="exam")
public class ExamEntity implements Serializable {

    public ExamEntity() {
        super();
    }

    public ExamEntity(long id_exam, String name, String description, int credits,List<UserEntity> user_list) {
        this.id_exam = id_exam;
        this.name = name;
        this.description = description;
        this.credits = credits;
        this.user_list = user_list;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @NotEmpty
    @Column(name="id_exam", nullable=false)
    private long id_exam;

    @Column(name="name")
    private String name;

    @Column(name="description")
    private String description;

    @Column(name="credits")
    private int credits;

    @ManyToMany(mappedBy = "exam_set")
    private List<UserEntity> user_list;

    public long getId_exam() {
        return id_exam;
    }

    public void setId_exam(long id_exam) {
        this.id_exam = id_exam;
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

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

    public List<UserEntity> getUser_list() {
        return user_list;
    }

    public void setUser_list(List<UserEntity> user_list) {
        this.user_list = user_list;
    }
}
