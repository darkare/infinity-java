package com.dfong.security.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.dfong.security.entity.Party;

@Repository
public interface PartyRepository extends CrudRepository<Party, Integer> {

}
