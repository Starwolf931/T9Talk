package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the pitanje database table.
 * 
 */
@Entity
@NamedQuery(name="Pitanje.findAll", query="SELECT p FROM Pitanje p")
public class Pitanje implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int pitanjeid;

	@Lob
	private String text;

	private int tipodgovora;

	//bi-directional many-to-one association to Odgovor
	@OneToMany(mappedBy="pitanje", fetch=FetchType.EAGER)
	private List<Odgovor> odgovors;

	//bi-directional many-to-one association to Test
	@ManyToOne
	@JoinColumn(name="TESTID")
	private Test test;

	//bi-directional many-to-one association to Uradjenopitanje
	@OneToMany(mappedBy="pitanje", fetch=FetchType.EAGER)
	private List<Uradjenopitanje> uradjenopitanjes;

	public Pitanje() {
	}

	public int getPitanjeid() {
		return this.pitanjeid;
	}

	public void setPitanjeid(int pitanjeid) {
		this.pitanjeid = pitanjeid;
	}

	public String getText() {
		return this.text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getTipodgovora() {
		return this.tipodgovora;
	}

	public void setTipodgovora(int tipodgovora) {
		this.tipodgovora = tipodgovora;
	}

	public List<Odgovor> getOdgovors() {
		return this.odgovors;
	}

	public void setOdgovors(List<Odgovor> odgovors) {
		this.odgovors = odgovors;
	}

	public Odgovor addOdgovor(Odgovor odgovor) {
		getOdgovors().add(odgovor);
		odgovor.setPitanje(this);

		return odgovor;
	}

	public Odgovor removeOdgovor(Odgovor odgovor) {
		getOdgovors().remove(odgovor);
		odgovor.setPitanje(null);

		return odgovor;
	}

	public Test getTest() {
		return this.test;
	}

	public void setTest(Test test) {
		this.test = test;
	}

	public List<Uradjenopitanje> getUradjenopitanjes() {
		return this.uradjenopitanjes;
	}

	public void setUradjenopitanjes(List<Uradjenopitanje> uradjenopitanjes) {
		this.uradjenopitanjes = uradjenopitanjes;
	}

	public Uradjenopitanje addUradjenopitanje(Uradjenopitanje uradjenopitanje) {
		getUradjenopitanjes().add(uradjenopitanje);
		uradjenopitanje.setPitanje(this);

		return uradjenopitanje;
	}

	public Uradjenopitanje removeUradjenopitanje(Uradjenopitanje uradjenopitanje) {
		getUradjenopitanjes().remove(uradjenopitanje);
		uradjenopitanje.setPitanje(null);

		return uradjenopitanje;
	}

}