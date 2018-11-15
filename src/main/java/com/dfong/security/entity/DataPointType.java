package com.dfong.security.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="datapoint_type")
public class DataPointType {
	@Id
	@Column(name = "datapoint_type_id")
	@GeneratedValue
	private int id;
	
	@Column(name = "datapoint_type_name")
	private String dataPointTypeName;
	
	@Column(name = "survey_id") 
	private int surveyId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDataPointTypeName() {
		return dataPointTypeName;
	}

	public void setDataPointTypeName(String dataPointTypeName) {
		this.dataPointTypeName = dataPointTypeName;
	}

	public int getSurveyId() {
		return surveyId;
	}

	public void setSurveyId(int surveyId) {
		this.surveyId = surveyId;
	}
	
	
}
