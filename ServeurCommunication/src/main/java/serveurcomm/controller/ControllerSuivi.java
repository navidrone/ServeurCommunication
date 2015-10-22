package serveurcomm.controller;

import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import rmi.FabriqueMissionInt;
import rmi.MissionInt;
import rmi.ReleveInt;

@Controller
public class ControllerSuivi {
	
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
	
	 @RequestMapping(value = "/vueMission", method = RequestMethod.GET)
		public ModelAndView vueMission(@RequestParam ("id") int id) throws RemoteException, NotBoundException {
		 
		 MissionInt mission = (MissionInt)getFabriqueMission().getMission(id);
		 
		 List<? extends ReleveInt> listReleveInt = mission.getReleve();
		 ArrayList parcours = new ArrayList();
//		 for(ReleveInt r:listReleveInt){
//
//			 System.out.println("Client exception: " + r.getCoordGps().getLattitude());
//		 }
		 for (int i=0; i<listReleveInt.size(); i++)
		 {
			 parcours.add(listReleveInt.get(i).getCoordGps().getLattitude());
			 parcours.add(listReleveInt.get(i).getCoordGps().getLongitude());
			 
		 }
			 
			
			ModelAndView model = new ModelAndView("vueMission");
			model.addObject("mission",mission);
			model.addObject("releves",listReleveInt);
			model.addObject("parcours",parcours);
			
			return model;
	        
	    }
		 

	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public ModelAndView map(){

		ModelAndView model = new ModelAndView("testMap");
						 
		return model;
	}
}
