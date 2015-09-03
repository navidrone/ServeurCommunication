package serveurcomm.controller;

import java.rmi.Naming;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import rmi.FabriqueMissionInt;
import serveurcomm.modele.bean.Mission;

@Controller
public class ControllerDefault {
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView helloWorld(){

		ModelAndView model = new ModelAndView("accueil");
		model.addObject("titrePage", "accueil");
		model.addObject("msg", "hello world");
		model.addObject("autre", "Message spécial");
		
		 try {

	            FabriqueMissionInt stub =  (FabriqueMissionInt) Naming.lookup("rmi://localhost:1099/FabriqueMission");
	            Mission mission = (Mission) stub.getMission(0);
	            System.out.println("mission: " + mission);            

	    		
	    		model.addObject("nom", mission.getId());
	    		model.addObject("prenom", "Mission laodée par RMI");
	            
	        } catch (Exception e) {
	            System.err.println("Client exception: " + e.toString());
	            e.printStackTrace();
	        }
		 
		return model;
	}
	
	@RequestMapping(value = "/creer", method = RequestMethod.GET)
	public ModelAndView creer(){

		ModelAndView model = new ModelAndView("creerMission");
				 
		return model;
	}
	@RequestMapping(value = "/creer", method = RequestMethod.POST)
	public ModelAndView creerm(HttpServletRequest request){
		

		String title = request.getParameter("title");
		

		ModelAndView model = new ModelAndView("creerMission");
		
		model.addObject("titrePage", "accueil");
		model.addObject("msg", "hello world");
		model.addObject("autre", "Message spécial");
		model.addObject("title", title);
		
			
		return model;
	}
	

	
}