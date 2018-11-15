package com.dfong.security.entity;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "participant_survey")
public class ParticipantSurvey {
	@Id
	@Column(name = "participant_survey_id")
	@GeneratedValue
	private int id;
	
public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="participant_id")
	private int participantId; 
	
	

	public int getParticipantId() {
		return participantId;
	}

	public void setParticipantId(int participantId) {
		this.participantId = participantId;
	}

	//	private Party participant;
//	private Party coach; 
//	private Cohort
	
	@Column(name="participant_survey_date")
	private Date surveyDate ;
	
	@Column(name="participant_survey_context")
	private String Context;
	
	@OneToMany(
	      cascade = CascadeType.ALL, 
	        orphanRemoval = true
	        
	    )
	@JoinColumn(name="participant_survey_id")
	private List<SurveyResult> surveyResults = new ArrayList<>();
	
	@OneToMany(
		      cascade = CascadeType.ALL, 
		        orphanRemoval = true
    )
		@JoinColumn(name="participant_survey_id")
	private List<ParticipantBusinessObjective> businessObjectives = new ArrayList<>();
	
//	public Party getParticipant() {
//		return participant;
//	}
//
//	public void setParticipant(Party participant) {
//		this.participant = participant;
//	}
//
//	public Party getCoach() {
//		return coach;
//	}
//
//	public void setCoach(Party coach) {
//		this.coach = coach;
//	}

	public List<ParticipantBusinessObjective> getBusinessObjectives() {
		return businessObjectives;
	}

	public void setBusinessObjectives(List<ParticipantBusinessObjective> businessObjectives) {
		this.businessObjectives = businessObjectives;
	}

	public Date getSurveyDate() {
		return surveyDate;
	}

	public void setSurveyDate(Date surveyDate) {
		this.surveyDate = surveyDate;
	}

	public String getContext() {
		return Context;
	}

	public void setContext(String context) {
		Context = context;
	}

	public List<SurveyResult> getSurveyResults() {
		return surveyResults;
	}

	public void setSurveyResults(List<SurveyResult> surveyResults) {
		this.surveyResults = surveyResults;
	}
	

}
