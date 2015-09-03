package serveurcomm.controller;

import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import rmi.FabriqueMissionInt;
import rmi.MissionInt;
import rmi.ReleveInt;
import serveurcomm.modele.bean.CoordGps;
import serveurcomm.modele.bean.Mission;
import serveurcomm.modele.bean.Releve;

@Controller
public class ControllerDefault {
	
	private FabriqueMissionInt fabriqueMission;
	
	/**
	 * 
	 * Acc�s exclusif � la FabriqueMission RMI
	 * 
	 * @return
	 */
	private FabriqueMissionInt getFabriqueMission() {
		
		if(fabriqueMission == null){
			
			 try {
				 fabriqueMission =  (FabriqueMissionInt) Naming.lookup("rmi://localhost:1099/FabriqueMission");
		            
		        } catch (Exception e) {
		            System.err.println("Client exception: " + e.toString());
		            e.printStackTrace();
		        }
			
		}
		
		return fabriqueMission;
	}
		
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView helloWorld(){

		ModelAndView model = new ModelAndView("accueil");
		model.addObject("titrePage", "accueil");
		model.addObject("msg", "hello world");
		model.addObject("autre", "Message sp�cial");
				 
		return model;
	}
	
	@RequestMapping(value = "/creer", method = RequestMethod.GET)
	public ModelAndView creer(){

		ModelAndView model = new ModelAndView("creerMission");
		try{

			//MissionInt mission = new Mission(getFabriqueMission().getMission(1));
			
			MissionInt mission = (MissionInt)getFabriqueMission().getMission(1);
			
			System.out.println("Acc�s RMI � la mission 1 : "+mission.getName());
			System.out.println("Arborescence OK ? "+mission.getCoord_ar());
			
		}catch (Exception e){
			e.printStackTrace();
		}
				 
		return model;
	}
	@RequestMapping(value = "/creer", method = RequestMethod.POST)
	public ModelAndView creerm(HttpServletRequest request) throws RemoteException, NotBoundException {
		
		Mission mission =  new Mission();
		CoordGps coordGps_dep = new CoordGps();
		CoordGps coordGps_ar = new CoordGps();
				
		String title = request.getParameter("title");
		String type = request.getParameter("type");
		Double dLong = Double.parseDouble(request.getParameter("dLong"));
		Double dLat = Double.parseDouble(request.getParameter("dLat"));
		Double periode = Double.parseDouble(request.getParameter("periode"));
		int nbDrone = Integer.parseInt(request.getParameter("nbDrone"));
		Double densite = Double.parseDouble(request.getParameter("densite"));
		
		if("toc".equals(type)){
			Double portee = Double.parseDouble(request.getParameter("portee"));	
			mission.setPortee(portee);	
		}else{
			
			Double aLong = Double.parseDouble(request.getParameter("aLong"));
			Double aLat = Double.parseDouble(request.getParameter("aLat"));	
			coordGps_ar.setLongitude(aLat);
			coordGps_ar.setLongitude(aLong);	
			mission.setCoord_ar(coordGps_ar);	
		}
		
		coordGps_dep.setLongitude(dLat);
		coordGps_dep.setLongitude(dLong);
		
		mission.setName(title);
		mission.setType(type);
		mission.setCoord_dep(coordGps_dep);
		mission.setDensite(densite);
		mission.setPeriode(periode);
		mission.setNb_drone(nbDrone);
		
		
		try {
			
			getFabriqueMission().saveMission(mission);
			
			System.out.println("Mission" + mission + "enregistr�e par RMI ");
			// Demande Calcul du wayPoint en rmi
			// RelevePoint WayPointMission(mission);
            System.out.println("Mission enregistr�e par RMI ");            

		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		// Affichage recap mission + waypoint
		ModelAndView model = new ModelAndView("map");
		
		model.addObject("title", mission.getName());
			
		return model;
	}
	
	@RequestMapping(value = "/trajet", method = RequestMethod.GET)
	public ModelAndView trajet(){

		ModelAndView model = new ModelAndView("creerTrajet");
				 
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