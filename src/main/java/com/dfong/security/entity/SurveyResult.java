package com.dfong.security.entity;


import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="survey_result")
public class SurveyResult {
	@Column (name="survey_result_id")
	@Id
	@GeneratedValue
	private int id;
	
	@OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "participant_survey_id", nullable = false)
	private ParticipantSurvey partySurvey;
	
	@Column(name="dimension_id")
	private int dimensionId;
	
	@OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "survey_result_datapoint_type_id", nullable = false)
	private DataPointType dataPointType;
	
	@Column(name="survey_result_datapoint_value")
	private float dataPointValue;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public ParticipantSurvey getPartySurvey() {
		return partySurvey;
	}

	public void setPartySurvey(ParticipantSurvey partySurvey) {
		this.partySurvey = partySurvey;
	}

	public int getDimensionId() {
		return dimensionId;
	}

	public void setDimensionId(int dimensionId) {
		this.dimensionId = dimensionId;
	}

	public DataPointType getDataPointType() {
		return dataPointType;
	}

	public void setDataPointType(DataPointType dataPointType) {
		this.dataPointType = dataPointType;
	}

	public float getDataPointValue() {
		return dataPointValue;
	}

	public void setDataPointValue(float dataPointValue) {
		this.dataPointValue = dataPointValue;
	}
	
}
