package com.project.model;

import org.hibernate.annotations.ColumnDefault;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Entity
@Component
@Table(name= "attemp")
public class AttempEntity implements Serializable {

    public AttempEntity() {
        super();
    }

    public AttempEntity(long exam_fk, long session_fk, int count) {
        this.exam_fk = exam_fk;
        this.session_fk = session_fk;
        this.count = count;
    }

    @Id
    @NotNull
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_attemp")
    private long id_attemp;

    private long exam_fk;

    private long session_fk;

    @ColumnDefault("0")
    private int count;

    private int mark;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "fk_career")
    private UniversityCareerEntity career;

    public void increment(){
        count++;
    }

    public long getId_attemp() {
        return id_attemp;
    }

    public void setId_attemp(long id_attemp) {
        this.id_attemp = id_attemp;
    }

    public long getExam_fk() {
        return exam_fk;
    }

    public void setExam_fk(long exam_fk) {
        this.exam_fk = exam_fk;
    }

    public long getSession_fk() {
        return session_fk;
    }

    public void setSession_fk(long session_fk) {
        this.session_fk = session_fk;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getMark() {
        return mark;
    }

    public void setMark(int mark) {
        this.mark = mark;
    }
}
