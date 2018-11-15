package com.dfong.security.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="vw_survey_result")
public class SurveyResultView {
	
 @Column
 @Id
 private int surveyResultId;
	
  
  @Column
  private int surveyId;
  
  @Column
  private int dimensionId;
  
  @Column
  private String dimensionName;
  
  @Column (name="parent_id")
  private int dimensionParentId;
  
  @Column
  private int participantSurveyId;
  
  @Column 
  private int participantId;
  
  @Column 
  private String datapointTypeName;

  @Column (name="survey_result_datapoint_value")
  private Float datapointValue;
  
  @Column
  private int depth;
  
  @Column
  private int dimensionDisplayOrder;

public int getSurveyId() {
	return surveyId;
}

public void setSurveyId(int surveyId) {
	this.surveyId = surveyId;
}

public int getDimensionId() {
	return dimensionId;
}

public void setDimensionId(int dimensionId) {
	this.dimensionId = dimensionId;
}

public String getDimensionName() {
	return dimensionName;
}

public void setDimensionName(String dimensionName) {
	this.dimensionName = dimensionName;
}

public int getDimensionParentId() {
	return dimensionParentId;
}

public void setDimensionParentId(int dimensionParentId) {
	this.dimensionParentId = dimensionParentId;
}

public int getParticipantId() {
	return participantId;
}

public void setParticipantId(int participantId) {
	this.participantId = participantId;
}

public String getDatapointTypeName() {
	return datapointTypeName;
}

public void setDatapointTypeName(String datapointTypeName) {
	this.datapointTypeName = datapointTypeName;
}

public Float getDatapointValue() {
	return datapointValue;
}

public void setDatapointValue(Float datapointValue) {
	this.datapointValue = datapointValue;
}

public int getDepth() {
	return depth;
}

public void setDepth(int depth) {
	this.depth = depth;
}

public int getDimensionDisplayOrder() {
	return dimensionDisplayOrder;
}

public void setDimensionDisplayOrder(int dimensionDisplayOrder) {
	this.dimensionDisplayOrder = dimensionDisplayOrder;
}
  
@Override 
public String toString() {
	return this.surveyResultId + "dim:" + this.getDimensionId() + "- dimName:" + this.getDimensionName() + "- parentId:" + this.getDimensionParentId()
	   + "-type:" + this.getDatapointTypeName() + "-dOrder:" + this.getDimensionDisplayOrder();
}
  
  
}
