package com.project.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Entity
@Component
@Table (name="exam")
public class ExamEntity implements Serializable
{
    private static final long serialVersionUID = 4296529480985482024L;

    public ExamEntity() {
        super();
    }
    
    public ExamEntity( long id_exam, String name, String description, int credits)
    {
        this.id_exam = id_exam;
        this.name = name;
        this.description = description;
        this.credits = credits;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @NotNull
    @Column(name="id_exam", nullable=false)
    private long id_exam;

    @Column(name="name")
    private String name;

    @Column(name="description", length = 1000)
    private String description;

    @Column(name="credits")
    private int credits;

    @ManyToMany(mappedBy = "exam_list")
    private List<UserEntity> users_list;
    
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name="exam_id_fk")
    private List<MaterialEntity> material_list;
    
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name="exam_id_fk")
    private List<QuestionEntity> question_list;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "fk_exam")
    private List<SessionEntity> session_list;

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
    
    public List<MaterialEntity> getMaterial_list() {
        return material_list;
    }

    public void setMaterial_list( List<MaterialEntity> material_list) {
        this.material_list = material_list;
    }
    
    public List<QuestionEntity> getQuestion_list() {
        return question_list;
    }

    public void setQuestion_list( List<QuestionEntity> material_list) {
        this.question_list = material_list;
    }

    public List<SessionEntity> getSession_list() {
        return session_list;
    }

    public void setSession_list(List<SessionEntity> session_list) {
        this.session_list = session_list;
    }

    public List<UserEntity> getUsers_list() {
        return users_list;
    }

    public void setUsers_list(List<UserEntity> users_list) {
        this.users_list = users_list;
    }
}
