package com.dfong.security.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.dfong.security.entity.SurveyResultView;


@Repository
public interface SurveyResultViewRepository extends ReadOnlyRepository<SurveyResultView, Integer> {

	@Query(value="SELECT srv.* FROM vw_survey_result srv WHERE srv.participant_id = ?1 and srv.survey_id = ?2 ORDER BY srv.depth, srv.datapoint_type_name, srv.dimension_display_order", nativeQuery=true)
	//@Query 	(value = "SELECT v from SurveyResultView v WHERE v.participantId= ?1 and v.surveyId = ?2" )
	List<SurveyResultView> findByParticipantIdAndSurveyId(Integer participantId, Integer surveyId);
	
	
	List<SurveyResultView> findByParticipantSurveyId(Integer participantSurveyId);
}
