package com.dfong.security.service;

import java.util.List;

import com.dfong.security.entity.ParticipantSurvey;
import com.dfong.security.entity.ParticipantSurveyView;
import com.dfong.security.entity.SurveyResultView;

public interface IParticipant {
    public List<ParticipantSurveyView> getParticipantSurveys(int partipantId);
    public List<ParticipantSurvey> getParticipantSurvey(int surveyId);
    public List<SurveyResultView> getSurveyResult (int participantId, int surveyId);
    public List<SurveyResultView> getSurveyResultsByParticipantSurveyId (int participantSurveyId) ;
}
