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
	private CoordGps coord_dep;
	private CoordGps coord_ar;
	private Double periode;
	private int nbDrone;
	private Double densite;
	private Double portee;
	
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

	public CoordGps getCoord_dep() {
		return coord_dep;
	}

	public void setCoord_dep(CoordGps coord_dep) {
		this.coord_dep = coord_dep;
	}

	public CoordGps getCoord_ar() {
		return coord_ar;
	}

	public void setCoord_ar(CoordGps coord_ar) {
		this.coord_ar = coord_ar;
	}

	public Double getPeriode() {
		return periode;
	}

	public void setPeriode(Double periode) {
		this.periode = periode;
	}

	public int getNb_drone() {
		return nbDrone;
	}

	public void setNb_drone(int nb_drone) {
		this.nbDrone = nb_drone;
	}

	public Double getDensite() {
		return densite;
	}

	public void setDensite(Double densite2) {
		this.densite = densite2;
	}

	public Double getPortee() {
		return portee;
	}

	public void setPortee(Double portee) {
		this.portee = portee;
	}

	
}