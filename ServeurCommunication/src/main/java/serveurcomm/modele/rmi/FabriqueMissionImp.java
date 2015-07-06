package serveurcomm.modele.rmi;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

import org.springframework.beans.factory.annotation.Autowired;

import serveurcomm.modele.bean.Mission;
import serveurcomm.modele.dao.MissionDAO;

public class FabriqueMissionImp extends UnicastRemoteObject implements FabriqueMissionInt {

	@Autowired
    private MissionDAO missionDao;
	
	private static final long serialVersionUID = 1L;

	public FabriqueMissionImp() throws RemoteException{}

	public Mission getMission(int id) throws RemoteException {
		// TODO Auto-generated method stub
		return null;
	}

	public void saveMission(Mission mission) throws RemoteException {
		// TODO Auto-generated method stub
		
	}

	public void deleteMission(int id) throws RemoteException {
		// TODO Auto-generated method stub
		
	}
	
	
	

}
