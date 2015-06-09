package serveurcomm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value = "/creationMission", method = RequestMethod.GET)
	public ModelAndView creationMission(){
		
		ModelAndView model = new ModelAndView("creationMission");
		System.out.println("Configuration de la mission");
		
		return null;
		//return model;
	}
	
	@RequestMapping(value = "/enregistrerMission", method = RequestMethod.POST)
    public ModelAndView enregistrerMission(@ModelAttribute Mission mission) {
		/**
		 * Contrôle de la cohérence de la mission
		 */
		MissionDao missionDao = new MissionDao();
		missionDao.save(mission);
		
		ModelAndView model = new ModelAndView("recapCreationMission");
		model.addObject("mission", mission);
		
		System.out.println("Mission enregistré");
		return null;
        //return model;
    }
	
	@RequestMapping(value = "/lancementMission", method = RequestMethod.POST)
    public ModelAndView lancementMission(@ModelAttribute Mission mission) {
		/**
		 * Contrôle de la cohérence de la mission
		 */
		System.out.println("Vérification de la liste des drones");
		envoiMissionDrone();
		
		ModelAndView model = new ModelAndView("validationLancementMission");
		model.addObject("mission", mission);
		
		return null;
        //return model;
    }

	@RequestMapping(value = "/transfertTampon", method = RequestMethod.POST)
    public ModelAndView transfertTampon(@RequestParam("donnees_json") String donnees_json, 
    		@RequestParam("id_mission") String id_mission) {
		/**
		 * Contrôle de la cohérence de la mission
		 */
		System.out.println("Récupération des données partielles de la mission");
		enregistrerDonneesTampon(donnees_json, id_mission);

		
		System.out.println("Mission enregistré");
		return null;
        //return model;
    }
	
	
	private void enregistrerDonneesTampon(String donnees_json, String id_mission) {
		System.out.println("Enregistrement des données partielles en base");
	}

	/**
	 * méthode présente dans une classe de service qui contrôle les objets distribués
	 */
	private void envoiMissionDrone() {
		System.out.println("Transmission de la mission au drone");
	}
	
	
}