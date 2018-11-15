package com.dfong.security.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dfong.security.entity.ParticipantSurvey;
import com.dfong.security.entity.ParticipantSurveyView;
import com.dfong.security.entity.SurveyResultView;
import com.dfong.security.service.ParticipantService;
import com.dfong.security.util.IConstant;

@Controller
//@RequestMapping("/participant")
public class ParticipantController {
	
	private ParticipantService partiService;
	
	@Autowired
	public void setParticipantService (ParticipantService ps) {
		this.partiService = ps;
	}
	
	@RequestMapping(value = {"/participant/result/{partyId}",
			                 "/participant/result/{partyId}/{surveyId}",
			                 "/participant/result/{partyId}/{surveyId}/{parentDimId}"})
	public String getParticipantSurvey(@PathVariable Integer partyId, 
			                          @PathVariable Optional<Integer> surveyId, 
			                          @PathVariable Optional<Integer> parentDimId,
			                          Model model) {
		
		int defaultSurveyId = 0;
		ParticipantSurveyView psView = null;
		
		//List all the surveys
		List<ParticipantSurveyView> surveys = this.partiService.getParticipantSurveys(partyId);
		List<SurveyResultView> resultViewList = null;
				
		//if there is  survey id, then choose that, if not, default to the first survey
		if (surveyId.isPresent()) {
			defaultSurveyId = surveyId.get().intValue();
		}
		else {
			//if not empty-get the first survey in the sorted by survey date list 
			if (!surveys.isEmpty()) {
			   defaultSurveyId = surveys.get(0).getSurveyId(); 	
			}
		}
		
		//fetch all the survey results for this participant and survey
		if (defaultSurveyId != 0) {
			psView = this.getCurrentSurvey(surveys, defaultSurveyId);
			model.addAttribute("currentSurvey", psView);
            
			//resultViewList = this.partiService.getSurveyResult(partyId, defaultSurveyId);
			resultViewList = this.partiService.getSurveyResultsByParticipantSurveyId(psView.getParticipantSurveyId());
			
			System.out.println(resultViewList.size() + ": surveys taken: " + surveys.size());
			Map chartValMap = this.getChartValues(resultViewList, parentDimId);
			model.mergeAttributes(chartValMap);
			
		}
		
		//back to view
		model.addAttribute("surveyId", defaultSurveyId);
		model.addAttribute("surveys", surveys);
		
		model.addAttribute("participantId", partyId);
		return "home";
		
	}

	
//	public int countBusinessObjective (ParticipantSurvey pSurvey) {
//		
//	}
	

	
	/**
	 * Get the category for the children of the given dimension id
	 * @param parentId Optional. if this is not given it will default to the first in the first row from the list. 
	 * @return HashMap of 3 keys - Category (CATS), Self score (SSCORE), Evaluators score (ESCORE)
	 */
	private Map getChartValues(List<SurveyResultView> aResultViewList, Optional<Integer> aParentId) {
		int currentParentId = 0;
		Map retMap = new HashMap();
		
		
		//determine the parent id. If not present, will take the lastest survey first record(the list is already sorted)
		if (aParentId.isPresent()) {
			currentParentId = aParentId.get().intValue();
		}
		else {
			if (!aResultViewList.isEmpty()) {
				  currentParentId = aResultViewList.get(0).getDimensionParentId();
			}
		}

		 
		// Iterate the survey result list
		Iterator<SurveyResultView> myiter = aResultViewList.iterator();
		HashSet<String> dimHash = new HashSet<String>();
		ArrayList <Integer> dimIdList = new ArrayList<Integer>();
		ArrayList <String> dimList = new ArrayList<String>();
		ArrayList <Float> sScoreList = new ArrayList<Float>();
		ArrayList <Float> eScoreList = new ArrayList<Float>();
		ArrayList <SurveyResultView> breadCrumbList = new ArrayList<SurveyResultView>();
		
		while (myiter.hasNext()) {
			SurveyResultView r = myiter.next();
			//building the breadcrumb
			//[TODO]
			boolean isBreadCrumbDone = false;
			if (! isBreadCrumbDone) {
				System.out.println("adding:" + r.getDimensionName());
			    //breadCrumbList.add(r);
			}
			
			// filter for matching parentid
			if (r.getDimensionParentId() == currentParentId) {
				//child object found
				isBreadCrumbDone = true;
				
				
			   if (!dimHash.contains(r.getDimensionName())) {
				   dimHash.add(r.getDimensionName());
				   dimList.add(r.getDimensionName());
				   dimIdList.add(r.getDimensionId());
 			   }
			   if ("Evaluators".equals(r.getDatapointTypeName())) {
				   eScoreList.add(r.getDatapointValue());
			   }
			   if ("Self".equals(r.getDatapointTypeName())) {
				   sScoreList.add(r.getDatapointValue());
			   }
		    }
		}
		retMap.put("CAT_DIM_ID", dimIdList);
		retMap.put(IConstant.CATS, dimList);
		retMap.put(IConstant.EVALUATOR_SCORE, eScoreList);
		retMap.put(IConstant.SELF_SCORE, sScoreList);
		retMap.put("BREADCRUMB",breadCrumbList);
		
//		System.out.println("dimlist:" + dimList);
//		System.out.println("eScorelist:" + eScoreList);
//		System.out.println("sScorelist:" + sScoreList);
		return retMap;
	}
	
	/**
	 * Loop through a list of surveys and return the one that matches the defaultSurveyId
	 * @param surveys
	 * @param defaultSurveyId
	 * @return An instance of ParticipantSurveyView
	 */
	private ParticipantSurveyView getCurrentSurvey(List<ParticipantSurveyView> surveys, int defaultSurveyId) {
		ParticipantSurveyView retSurvey = null;
		for (ListIterator<ParticipantSurveyView> iter = surveys.listIterator(); iter.hasNext();) {
			ParticipantSurveyView i = iter.next();
			if (i.getSurveyId() == defaultSurveyId) {
				retSurvey =  i;
				break;
			}
		}
		return retSurvey;
	}
}
