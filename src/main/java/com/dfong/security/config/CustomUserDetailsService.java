package com.dfong.security.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.dfong.security.entity.PartyUser;
import com.dfong.security.repository.PartyUserRepository;

@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService {
    private final PartyUserRepository uRepository;
	
	@Autowired
	public CustomUserDetailsService (PartyUserRepository puRepository) {
		 this.uRepository = puRepository;
		
	}
	
	@Override
	public CustomUserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		 PartyUser pu = this.uRepository.findByUsername(username);

		 if (null == pu) {
			 throw new UsernameNotFoundException("User " + username + "not found.");
		 }
		 //[DEBUG]System.out.println("note:" + pu.getUsername() + ":" + pu.getPassword() + ":");
		 return new CustomUserDetails(pu);
		 
//		 UserDetails user =
//	             User.withUsername(pu.getUsername())
//	                .password(pu.getPassword())
//	                .roles("USER")
//	                .build();
//
//	        
//		return  user;
	}


}
