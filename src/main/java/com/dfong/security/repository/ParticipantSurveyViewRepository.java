package com.dfong.security.repository;

import java.util.List;

import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.stereotype.Repository;

import com.dfong.security.entity.ParticipantSurveyView;

@Repository
public interface ParticipantSurveyViewRepository extends ReadOnlyRepository<ParticipantSurveyView, Integer> {
    //TODO: use JPA notation to sort the survey date
	List<ParticipantSurveyView> findByParticipantId(int id);
}
