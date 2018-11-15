package com.dfong.security.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.dfong.security.entity.PartyUser;

@Repository
public interface PartyUserRepository extends CrudRepository<PartyUser, Integer> {
	
	public PartyUser findByUsername (String username);
	
}
