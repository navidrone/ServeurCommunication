package serveurcomm.controller;

import java.rmi.Naming;

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
		model.addObject("autre", "Message sp�cial");
		
		 try {

	            FabriqueMissionInt stub =  (FabriqueMissionInt) Naming.lookup("rmi://localhost:1099/FabriqueMission");
	            Mission mission = (Mission) stub.getMission(0);
	            System.out.println("mission: " + mission);            

	    		
	    		model.addObject("nom", mission.getId());
	    		model.addObject("prenom", "Mission laod�e par RMI");
	            
	        } catch (Exception e) {
	            System.err.println("Client exception: " + e.toString());
	            e.printStackTrace();
	        }
		 
		return model;
	}
	
//	@RequestMapping(value = "/map", method = RequestMethod.GET)
//	public ModelAndView map(){
// 
//		ModelAndView model = new ModelAndView("map");
//		model.addObject("titrePage", "Carte du Canal du Midi");
//		model.addObject("lat", Double.toString(coordGpsDao.get(1).getLattitude()));
//		model.addObject("long", Double.toString(coordGpsDao.get(1).getLongitude()));
//		List<CoordGps> liste = coordGpsDao.list();
//		model.addObject("scriptPoints", this.GetPoints(liste));
//		model.addObject("scriptPolyline", this.GetPolyline(liste.size()));
//		model.addObject("lastPosIndex", Integer.toString(liste.size()));
//		return model;
//	}
//
//	private String GetPoints(List<CoordGps> liste) {
//		String script = "";
//		int index = 1;
//		for (CoordGps coordGps : liste) {
//			script += "var pos" + index + "=new google.maps.LatLng(" + coordGps.getLattitude() + ", " + coordGps.getLongitude() + ");\r\n";
//			index++;
//		}
//		return script;
//	}
//	
//	private String GetPolyline(int listSize) {
//		String script = "[";
//		for (int i = 1; i < listSize; i++) {
//			script += "pos" + i + ",";
//		}
//		script += "pos" + listSize + "]\r\n";
//		return script;
//	}
//	
//	@RequestMapping(value = "/creationMission", method = RequestMethod.GET)
//	public ModelAndView creationMission(){
//		
//		ModelAndView model = new ModelAndView("creationMission");
//		System.out.println("Configuration de la mission");
//		
//		return null;
//		//return model;
//	}
//	
//	@RequestMapping(value = "/enregistrerMission", method = RequestMethod.POST)
//    public ModelAndView enregistrerMission(@ModelAttribute Mission mission) {
//		/**
//		 * Contrôle de la cohérence de la mission
//		 */
//		MissionDAO missionDao = new MissionDAO();
//		missionDao.saveOrUpdate(mission);
//		
//		ModelAndView model = new ModelAndView("recapCreationMission");
//		model.addObject("mission", mission);
//		
//		System.out.println("Mission enregistré");
//		return null;
//        //return model;
//    }
//	
//	@RequestMapping(value = "/lancementMission", method = RequestMethod.POST)
//    public ModelAndView lancementMission(@ModelAttribute Mission mission) {
//		/**
//		 * Contrôle de la cohérence de la mission
//		 */
//		System.out.println("Vérification de la liste des drones");
//		envoiMissionDrone();
//		
//		ModelAndView model = new ModelAndView("validationLancementMission");
//		model.addObject("mission", mission);
//		
//		return null;
//        //return model;
//    }
//
//	@RequestMapping(value = "/transfertTampon", method = RequestMethod.POST)
//    public ModelAndView transfertTampon(@RequestParam("donnees_json") String donnees_json, 
//    		@RequestParam("id_mission") String id_mission) {
//		/**
//		 * Contrôle de la cohérence de la mission
//		 */
//		System.out.println("Récupération des données partielles de la mission");
//		enregistrerDonneesTampon(donnees_json, id_mission);
//
//		
//		System.out.println("Mission enregistré");
//		return null;
//        //return model;
//    }
//	
//	
//	private void enregistrerDonneesTampon(String donnees_json, String id_mission) {
//		System.out.println("Enregistrement des données partielles en base");
//	}
//
//	/**
//	 * méthode présente dans une classe de service qui contrôle les objets distribués
//	 */
//	private void envoiMissionDrone() {
//		System.out.println("Transmission de la mission au drone");
//	}
//	
	
}