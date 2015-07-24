package serveurcomm.modele.bean;

import java.io.Serializable;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import rmi.MissionInt;

@Entity
@Table(name = "MISSION")
public class Mission extends UnicastRemoteObject implements Serializable,MissionInt{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String titre;
	private String type;
	private float long_dep;
	private float lat_dep;
	private float long_ar;
	private float lat_ar;
	private float periode;
	private int nb_drone;
	private float densite;
	private float portee;
	
	public Mission() throws RemoteException {
		super();
	}

	@Id
    @GeneratedValue
    @Column(name = "MISSION_ID")
	private Integer id;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitre() {
		return titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public float getLong_dep() {
		return long_dep;
	}

	public void setLong_dep(float long_dep) {
		this.long_dep = long_dep;
	}

	public float getLat_dep() {
		return lat_dep;
	}

	public void setLat_dep(float lat_dep) {
		this.lat_dep = lat_dep;
	}

	public float getLong_ar() {
		return long_ar;
	}

	public void setLong_ar(float long_ar) {
		this.long_ar = long_ar;
	}

	public float getLat_ar() {
		return lat_ar;
	}

	public void setLat_ar(float lat_ar) {
		this.lat_ar = lat_ar;
	}

	public float getPeriode() {
		return periode;
	}

	public void setPeriode(float periode) {
		this.periode = periode;
	}

	public int getNb_drone() {
		return nb_drone;
	}

	public void setNb_drone(int nb_drone) {
		this.nb_drone = nb_drone;
	}

	public float getDensite() {
		return densite;
	}

	public void setDensite(float densite) {
		this.densite = densite;
	}

	public float getPortee() {
		return portee;
	}

	public void setPortee(float portee) {
		this.portee = portee;
	}

	
}