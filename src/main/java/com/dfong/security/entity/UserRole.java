package com.dfong.security.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user_role")

public class UserRole {
	@Id
	@Column(name = "user_role_id")
	@GeneratedValue
	private int id;
	
	@Column(name = "role_type")
	private String roleType;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRoleType() {
		return roleType;
	}

	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}
	
	@OneToOne(fetch = FetchType.LAZY,
            cascade =  CascadeType.ALL,
            mappedBy = "userRole")
	PartyUser pu;
	
	public PartyUser getPartyUser() {
		return this.pu;
	}
	public void setPartyUser(PartyUser pu) {
		this.pu = pu;
	}
	
}
