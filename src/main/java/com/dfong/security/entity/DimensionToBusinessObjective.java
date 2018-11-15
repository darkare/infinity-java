package com.dfong.security.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="dimension_to_business_objective")
public class DimensionToBusinessObjective {
	@Id
	@Column (name="dimension_to_business_objective_id")
	private int id;
	

}
