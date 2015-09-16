package serveurcomm.controller;

import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import rmi.FabriqueMissionInt;
import rmi.MissionInt;
import serveurcomm.modele.bean.CoordGps;
import serveurcomm.modele.bean.Mission;

@Controller
public class ControllerDefault {
	
	private FabriqueMissionInt fabriqueMission;
	
	/**
	 * 
	 * Accès exclusif à la FabriqueMission RMI
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
		
	@RequestMapping(value = "/accueil", method = RequestMethod.GET)
	public ModelAndView helloWorld(){

		ModelAndView model = new ModelAndView("accueil");
		model.addObject("titrePage", "Navidrone");
				 
		return model;
	}
	
	@RequestMapping(value = "/creer", method = RequestMethod.GET)
	public ModelAndView creer(){

		ModelAndView model = new ModelAndView("creerMission");
		try{
			
			MissionInt mission = (MissionInt)getFabriqueMission().getMission(1);
			
			System.out.println("Accès RMI à la mission 1 : "+mission.getName());
			System.out.println("Arborescence OK ? "+mission.getCoord_ar().getLattitude());
			
		}catch (Exception e){
			e.printStackTrace();
		}
				 
		return model;
	}
	@RequestMapping(value = "/creer", method = RequestMethod.POST)
	public ModelAndView creerm(HttpServletRequest request) throws RemoteException, NotBoundException {
		
		Mission mission =  new Mission();
		
		renseigneMissionDepuisFormulaire(mission,request);		
		
		try {
			
			getFabriqueMission().saveMission(mission);
			
			System.out.println("Mission" + mission + "enregistrée par RMI ");
            System.out.println("Mission enregistrée par RMI ");            

		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		// A faire - fonction listMission
		ModelAndView model = new ModelAndView("listMission");
			
		return model;
	}
	

	@RequestMapping(value = "/modifier", method = RequestMethod.POST)
	public ModelAndView modifier(HttpServletRequest request) throws RemoteException, NotBoundException {
		

		Mission mission =  new Mission();
		
		renseigneMissionDepuisFormulaire(mission,request);		
		
		// Affichage recap mission + waypoint
		ModelAndView model = new ModelAndView("testMap");
		
			
		return model;
		
	}
	
	@RequestMapping(value = "/missions", method = RequestMethod.GET)
	public ModelAndView missions() throws RemoteException, NotBoundException {
	
		//List<MissionInt> missions = (List<MissionInt>)getFabriqueMission().getListMission();
		ModelAndView model = new ModelAndView("listMissions");
		//model.addObject("missions", missions);
		return model;
        
    }
	
	@RequestMapping(value = "/missions", method = RequestMethod.POST)
	public ModelAndView missions(@RequestParam ("id") int id) throws RemoteException, NotBoundException {
	
		//List<MissionInt> missions = (List<MissionInt>)getFabriqueMission().getListMission();
		ModelAndView model = new ModelAndView("missions");
		//model.addObject("missions", missions);
		return model;
        
    }
	
	
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
	
	
	
	/**
	 * 
	 * A partir des formulaires de création/modification de mission
	 * Renseigne une mission vierge avec les informations du formulaire
	 * 
	 * @param mission
	 * @param request
	 */
	private void renseigneMissionDepuisFormulaire(Mission mission,HttpServletRequest request) throws RemoteException{		

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
			coordGps_ar.setLattitude(aLat);
			coordGps_ar.setLongitude(aLong);	
			mission.setCoord_ar(coordGps_ar);	
		}
		
		coordGps_dep.setLattitude(dLat);
		coordGps_dep.setLongitude(dLong);
		
		mission.setName(title);
		mission.setType(type);
		mission.setCoord_dep(coordGps_dep);
		mission.setDensite(densite);
		mission.setPeriode(periode);
		mission.setNb_drone(nbDrone);
	}
	
	
	
}