package com.dfong.security.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.dfong.security.entity.ParticipantSurvey;

@Repository
public interface ParticipantSurveyRepository extends CrudRepository<ParticipantSurvey, Integer> {
	public List<ParticipantSurvey> findByParticipantId (int participantId);
	
	public ParticipantSurvey findById(int participantSurveyId);
	
}
