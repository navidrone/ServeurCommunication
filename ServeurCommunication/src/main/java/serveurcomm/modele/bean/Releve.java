/**
 * 
 */
package serveurcomm.modele.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import rmi.CoordGpsInt;
import rmi.ReleveInt;

/**
 * @author Jullien
 *
 */
public class Releve implements Serializable, ReleveInt {

	private static final long serialVersionUID = 1L;	

	
	private CoordGps coordGps;

	private Double profondeur;

	private Date dateReleve;
	

	public Double getProfondeur() {
		return profondeur;
	}

	public void setProfondeur(Double profondeur) {
		this.profondeur = profondeur;
	}

	public Date getDateReleve() {
		return dateReleve;
	}

	public void setDateReleve(Date dateReleve) {
		this.dateReleve = dateReleve;
	}

	public CoordGps getCoordGps() {
		return coordGps;
	}

	public void setCoordGps(CoordGpsInt coordGps) {
		this.coordGps = (CoordGps)coordGps;
	}
	
}
