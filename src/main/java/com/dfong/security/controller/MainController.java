package com.dfong.security.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dfong.security.config.CustomUserDetails;
import com.dfong.security.entity.ParticipantSurvey;
import com.dfong.security.service.ParticipantService;

@Controller
@RequestMapping("/")
public class MainController {
	
	
	
	
	@RequestMapping (value= {"/","home"})
	@Secured("ROLE_PARTICIPANT")
	public String participantSurveyList() {
		
		String viewStr = "home";
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        CustomUserDetails userDetails = (CustomUserDetails)auth.getPrincipal();
        String roleType = userDetails.getUserRole().getRoleType();
        int participantId = userDetails.getId();
        
		if ("ROLE_PARTICIPANT".equals(roleType)) {
			
			viewStr = "redirect:/participant/result/" + participantId;
		}
		
		return viewStr;
	}
	
	
	
	
}
