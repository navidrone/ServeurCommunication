/**
 * 
 */
package serveurcomm.modele.bean;

import java.io.Serializable;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import rmi.DroneInt;

/**
 * @author Jullien
 *
 */

public class Drone extends UnicastRemoteObject implements Serializable, DroneInt {
	
	private static final long serialVersionUID = 1L;

	private Integer id;

	private String name;
	
	public Drone() throws RemoteException{
		super();
	}
	
	public Drone(String name) throws RemoteException{
		super();
		this.name = name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	

}
