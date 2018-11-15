package com.dfong.security.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dfong.security.entity.ParticipantSurvey;
import com.dfong.security.entity.ParticipantSurveyView;
import com.dfong.security.entity.SurveyResultView;
import com.dfong.security.repository.ParticipantSurveyRepository;
import com.dfong.security.repository.ParticipantSurveyViewRepository;
import com.dfong.security.repository.SurveyResultViewRepository;

@Service
public class ParticipantService implements IParticipant {
    
	
	private ParticipantSurveyRepository psRepos;
	private ParticipantSurveyViewRepository psViewRepos;
	private SurveyResultViewRepository surveyResultRepos;
	
	@Autowired
	public void setParticipantService(ParticipantSurveyRepository psr) {
		this.psRepos = psr;
	}
	@Autowired
	public void setParticipantSurveyViewRepository(ParticipantSurveyViewRepository psv) {
		this.psViewRepos = psv;
	}
	@Autowired
	public void setSurveyResultViewRepository(SurveyResultViewRepository aSurveyResultViewRepos) {
		this.surveyResultRepos = aSurveyResultViewRepos;
	}
    
	/**
	 * List of the surveys for a participant in a chronological order
	 */
	@Override
	public List<ParticipantSurveyView> getParticipantSurveys(int partipantId) {
		List<ParticipantSurveyView> retSurveys;
		List<ParticipantSurveyView> surveys = this.psViewRepos.findByParticipantId(partipantId);
		if (surveys == null) {
			retSurveys = new ArrayList<ParticipantSurveyView>();
			retSurveys.sort((ParticipantSurveyView v1, ParticipantSurveyView v2) 
					        -> v2.getParticipantSurveyDate().compareTo(v1.getParticipantSurveyDate()));
		}
		else {
			retSurveys = surveys;
		}
		
		return retSurveys;
	}
	
	@Override
	public List<SurveyResultView> getSurveyResult (int participantId, int surveyId) {
		List<SurveyResultView> retList = this.surveyResultRepos.findByParticipantIdAndSurveyId(participantId, surveyId);
		return retList;
	}

	@Override
	public List<ParticipantSurvey> getParticipantSurvey(int participantId) {
		List<ParticipantSurvey> s = psRepos.findByParticipantId(participantId);
		return s;
	}
	
	@Override
	public List<SurveyResultView> getSurveyResultsByParticipantSurveyId (int participantSurveyId) {
		List<SurveyResultView> retList = this.surveyResultRepos.findByParticipantSurveyId(participantSurveyId);
		return retList;
	}
	
	

}
