package serveurcomm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ControllerSuivi {

	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public ModelAndView map(){

		ModelAndView model = new ModelAndView("testMap");
						 
		return model;
	}
}
