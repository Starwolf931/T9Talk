package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the uradjentest database table.
 * 
 */
@Entity
@NamedQuery(name="Uradjentest.findAll", query="SELECT u FROM Uradjentest u")
public class Uradjentest implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int uradjentestid;

	//bi-directional many-to-one association to Uradjenopitanje
	@OneToMany(mappedBy="uradjentest", fetch=FetchType.EAGER)
	private List<Uradjenopitanje> uradjenopitanjes;

	//bi-directional many-to-one association to Kurs
	@ManyToOne
	@JoinColumn(name="KURSID")
	private Kurs kur;

	//bi-directional many-to-one association to Test
	@ManyToOne
	@JoinColumn(name="TESTID")
	private Test test;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="USERID")
	private User user;

	public Uradjentest() {
	}

	public int getUradjentestid() {
		return this.uradjentestid;
	}

	public void setUradjentestid(int uradjentestid) {
		this.uradjentestid = uradjentestid;
	}

	public List<Uradjenopitanje> getUradjenopitanjes() {
		return this.uradjenopitanjes;
	}

	public void setUradjenopitanjes(List<Uradjenopitanje> uradjenopitanjes) {
		this.uradjenopitanjes = uradjenopitanjes;
	}

	public Uradjenopitanje addUradjenopitanje(Uradjenopitanje uradjenopitanje) {
		getUradjenopitanjes().add(uradjenopitanje);
		uradjenopitanje.setUradjentest(this);

		return uradjenopitanje;
	}

	public Uradjenopitanje removeUradjenopitanje(Uradjenopitanje uradjenopitanje) {
		getUradjenopitanjes().remove(uradjenopitanje);
		uradjenopitanje.setUradjentest(null);

		return uradjenopitanje;
	}

	public Kurs getKur() {
		return this.kur;
	}

	public void setKur(Kurs kur) {
		this.kur = kur;
	}

	public Test getTest() {
		return this.test;
	}

	public void setTest(Test test) {
		this.test = test;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}