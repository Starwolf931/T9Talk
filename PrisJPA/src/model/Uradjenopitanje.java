package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the uradjenopitanje database table.
 * 
 */
@Entity
@NamedQuery(name="Uradjenopitanje.findAll", query="SELECT u FROM Uradjenopitanje u")
public class Uradjenopitanje implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int uradjenopitanjeid;

	private String odgovorid;

	//bi-directional many-to-one association to Pitanje
	@ManyToOne
	@JoinColumn(name="PITANJEID")
	private Pitanje pitanje;

	//bi-directional many-to-one association to Uradjentest
	@ManyToOne
	@JoinColumn(name="URADJENTESTID")
	private Uradjentest uradjentest;

	public Uradjenopitanje() {
	}

	public int getUradjenopitanjeid() {
		return this.uradjenopitanjeid;
	}

	public void setUradjenopitanjeid(int uradjenopitanjeid) {
		this.uradjenopitanjeid = uradjenopitanjeid;
	}

	public String getOdgovorid() {
		return this.odgovorid;
	}

	public void setOdgovorid(String odgovorid) {
		this.odgovorid = odgovorid;
	}

	public Pitanje getPitanje() {
		return this.pitanje;
	}

	public void setPitanje(Pitanje pitanje) {
		this.pitanje = pitanje;
	}

	public Uradjentest getUradjentest() {
		return this.uradjentest;
	}

	public void setUradjentest(Uradjentest uradjentest) {
		this.uradjentest = uradjentest;
	}

}