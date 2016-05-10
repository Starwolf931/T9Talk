package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the test database table.
 * 
 */
@Entity
@NamedQuery(name="Test.findAll", query="SELECT t FROM Test t")
public class Test implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int testid;

	private String naslov;

	private String opis;

	//bi-directional many-to-one association to Pitanje
	@OneToMany(mappedBy="test", fetch=FetchType.EAGER)
	private List<Pitanje> pitanjes;

	//bi-directional many-to-one association to Polaze
	@OneToMany(mappedBy="test", fetch=FetchType.EAGER)
	private List<Polaze> polazes;

	//bi-directional many-to-one association to Kurs
	@ManyToOne
	@JoinColumn(name="KURSID")
	private Kurs kur;

	//bi-directional many-to-one association to Uradjentest
	@OneToMany(mappedBy="test", fetch=FetchType.EAGER)
	private List<Uradjentest> uradjentests;

	public Test() {
	}

	public int getTestid() {
		return this.testid;
	}

	public void setTestid(int testid) {
		this.testid = testid;
	}

	public String getNaslov() {
		return this.naslov;
	}

	public void setNaslov(String naslov) {
		this.naslov = naslov;
	}

	public String getOpis() {
		return this.opis;
	}

	public void setOpis(String opis) {
		this.opis = opis;
	}

	public List<Pitanje> getPitanjes() {
		return this.pitanjes;
	}

	public void setPitanjes(List<Pitanje> pitanjes) {
		this.pitanjes = pitanjes;
	}

	public Pitanje addPitanje(Pitanje pitanje) {
		getPitanjes().add(pitanje);
		pitanje.setTest(this);

		return pitanje;
	}

	public Pitanje removePitanje(Pitanje pitanje) {
		getPitanjes().remove(pitanje);
		pitanje.setTest(null);

		return pitanje;
	}

	public List<Polaze> getPolazes() {
		return this.polazes;
	}

	public void setPolazes(List<Polaze> polazes) {
		this.polazes = polazes;
	}

	public Polaze addPolaze(Polaze polaze) {
		getPolazes().add(polaze);
		polaze.setTest(this);

		return polaze;
	}

	public Polaze removePolaze(Polaze polaze) {
		getPolazes().remove(polaze);
		polaze.setTest(null);

		return polaze;
	}

	public Kurs getKur() {
		return this.kur;
	}

	public void setKur(Kurs kur) {
		this.kur = kur;
	}

	public List<Uradjentest> getUradjentests() {
		return this.uradjentests;
	}

	public void setUradjentests(List<Uradjentest> uradjentests) {
		this.uradjentests = uradjentests;
	}

	public Uradjentest addUradjentest(Uradjentest uradjentest) {
		getUradjentests().add(uradjentest);
		uradjentest.setTest(this);

		return uradjentest;
	}

	public Uradjentest removeUradjentest(Uradjentest uradjentest) {
		getUradjentests().remove(uradjentest);
		uradjentest.setTest(null);

		return uradjentest;
	}

}