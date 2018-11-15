package com.dfong.security.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dfong.security.entity.Party;
import com.dfong.security.repository.PartyRepository;

@RestController
@RequestMapping("/posts")
public class PostController {

	
	@Autowired
    private PartyRepository partyRepo;
    
	@RequestMapping("/list")
	//@Secured("ROLE_ADMIN")
		public String list() {
		Optional<Party> p = partyRepo.findById(new Integer(6));
		//String ret;
		//p.ifPresent(f -> f.getContactFirstName());
		//String name = Optional.ofNullable(p).orElse
		p.ifPresent(name -> System.out.println( name.getContactFirstName()));
		return "list method called ...";
	}
	
	
}
