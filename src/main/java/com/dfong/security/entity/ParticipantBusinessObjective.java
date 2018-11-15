package com.dfong.security.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="participant_business_objective")
public class ParticipantBusinessObjective {
	@Id
	@Column
	private int participantBusinessObjectiveId;
	
//	@Column
//	private int participantSurveyId;
	
	@OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "business_objective_id", nullable = false)
	private BusinessObjective businessObjective;

	public int getParticipantBusinessObjectiveId() {
		return participantBusinessObjectiveId;
	}

	public void setParticipantBusinessObjectiveId(int participantBusinessObjectiveId) {
		this.participantBusinessObjectiveId = participantBusinessObjectiveId;
	}

//	public int getParticipantSurveyId() {
//		return participantSurveyId;
//	}
//
//	public void setParticipantSurveyId(int participantSurveyId) {
//		this.participantSurveyId = participantSurveyId;
//	}

	public BusinessObjective getBusinessObjective() {
		return businessObjective;
	}

	public void setBusinessObjective(BusinessObjective businessObjective) {
		this.businessObjective = businessObjective;
	}
	
	

}
