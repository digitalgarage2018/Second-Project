package com.project.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;


@Entity
@Component
@Table(name = "session")
public class SessionEntity implements Serializable {

	public SessionEntity() {
		super();
	}

	public SessionEntity(Long id_exam, Date data_start, Date data_end, boolean open) {
		this.id_exam = id_exam;
		this.date_start = data_start;
		this.date_end = data_end;
		this.open = open;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_session", nullable = false)
	private Long id_session;

	@Column(name = "id_exam", nullable = false)
	private Long id_exam;

	@Temporal(TemporalType.DATE)
	@Column(name = "date_start")
	private Date date_start;

	public Long getId_session() {
		return id_session;
	}

	public void setId_session(Long id_session) {
		this.id_session = id_session;
	}

	public Long getId_exam() {
		return id_exam;
	}

	public void setId_exam(Long id_exam) {
		this.id_exam = id_exam;
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

	public List<UserEntity> getUser_list() {
		return user_list;
	}

	public void setUser_list(List<UserEntity> user_list) {
		this.user_list = user_list;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "date_end")
	private Date date_end;

	@Column(name = "open")
	private boolean open;

	@ManyToMany(fetch = FetchType.EAGER)
	private List<UserEntity> user_list;

}
