package com.dfong.security.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "party_user")
public class PartyUser implements Serializable{
	
	@Id
	@Column(name = "party_id")
	@GeneratedValue
	private int id;
	
	@Column
	private String username;
	
	@Column
	private String password;
	
	@OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_permission_id", nullable = false)
	private UserRole userRole;

	public UserRole getUserRole() {
		return userRole;
	}


	public void setUserRole(UserRole userRole) {
		this.userRole = userRole;
	}
	
	public PartyUser() {	
	}
	
	/**
	 * This is needed for the CustomUserDetailsService if the user is found in the Party_User table 
	 * @param pu
	 */
	public PartyUser(PartyUser pu) {
		this.id = pu.id;
		this.username = pu.username;
		this.password = pu.password;
		this.userRole = pu.getUserRole();
				
	}
	

	public void setId(int id) {
		this.id = id;
	}


	public int getId() {
		return id;
	}


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

}
