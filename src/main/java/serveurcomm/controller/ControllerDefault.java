package serveurcomm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import serveurcomm.modele.dao.UtilisateurDAO;

@Controller
public class ControllerDefault {
	
	@Autowired
    private UtilisateurDAO utilisateurDao;


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView helloWorld(){
 
		ModelAndView model = new ModelAndView("accueil");
		model.addObject("titrePage", "accueil");
		model.addObject("msg", "hello world");
		System.out.println("COUCOUCOUCOU");
		return model;
	}
	
}