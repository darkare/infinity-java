package com.dfong.security.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="vw_participant_survey")
public class ParticipantSurveyView {
	
	
	@Column
	@Id
	private int participantSurveyId;
	
	public int getParticipantSurveyId() {
		return participantSurveyId;
	}

	@Column
	private int surveyId;
	
	@Column
	private String surveyName;
	
	@Column
	private String surveyTypeName;
	
	@Column
	private int participantId;
	
	@Column
	private Date participantSurveyDate;

	public int getSurveyId() {
		return surveyId;
	}

	public void setSurveyId(int surveyId) {
		this.surveyId = surveyId;
	}

	public String getSurveyName() {
		return surveyName;
	}

	public void setSurveyName(String surveyName) {
		this.surveyName = surveyName;
	}

	public String getSurveyTypeName() {
		return surveyTypeName;
	}

	public void setSurveyTypeName(String surveyTypeName) {
		this.surveyTypeName = surveyTypeName;
	}

	public int getParticipantId() {
		return participantId;
	}

	public void setParticipantId(int participantId) {
		this.participantId = participantId;
	}


	public Date getParticipantSurveyDate() {
		return participantSurveyDate;
	}

	public void setParticipantSurveyDate(Date participantSurveyDate) {
		this.participantSurveyDate = participantSurveyDate;
	}
	
	
}
