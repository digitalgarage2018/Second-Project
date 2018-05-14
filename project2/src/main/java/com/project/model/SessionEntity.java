package com.project.model;

import org.hibernate.type.descriptor.sql.TinyIntTypeDescriptor;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Component
@Table(name= "session")
public class SessionEntity implements Serializable {

    public SessionEntity() {
        super();
    }

    public SessionEntity(Date date_start, Date date_end, boolean open) {
        this.date_start = date_start;
        this.date_end = date_end;
        this.open = open;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @NotNull
    @Column(name="id_session", nullable=false)
    private long id_session;

    @Temporal(TemporalType.DATE)
    private Date date_start;

    @Temporal(TemporalType.DATE)
    private Date date_end;

    @Column(columnDefinition = "TINYINT", length = 4)
    private boolean open;

    public long getId_session() {
        return id_session;
    }

    public void setId_session(long id_session) {
        this.id_session = id_session;
    }

    public Date getDate_start() {
        return date_start;
    }

    public void setDate_start(Date date_start) {
        this.date_start = date_start;
    }

    public Date getDate_end() {
        return date_end;
    }

    public void setDate_end(Date date_end) {
        this.date_end = date_end;
    }

    public boolean isOpen() {
        return open;
    }

    public void setOpen(boolean open) {
        this.open = open;
    }

}
