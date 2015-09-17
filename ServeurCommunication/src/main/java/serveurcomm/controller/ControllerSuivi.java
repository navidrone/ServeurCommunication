package serveurcomm.controller;

import java.rmi.NotBoundException;
import java.rmi.RemoteException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ControllerSuivi {
	
	 @RequestMapping(value = "/vueMission", method = RequestMethod.GET)
		public ModelAndView vueMission(@RequestParam ("id") int id) throws RemoteException, NotBoundException {
		
			
			ModelAndView model = new ModelAndView("vueMission");
			
			return model;
	        
	    }
		 

	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public ModelAndView map(){

		ModelAndView model = new ModelAndView("testMap");
						 
		return model;
	}
}
