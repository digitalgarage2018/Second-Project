package com.project.service;

import com.project.model.UserEntity;

public interface StudentService {

    public void insertStudyPlan(long user_id, String[] exams);

    public boolean bookSession(UserEntity user, long id_session, long id_exam);
}