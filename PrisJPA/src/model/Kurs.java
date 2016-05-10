package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the kurs database table.
 * 
 */
@Entity
@NamedQuery(name="Kurs.findAll", query="SELECT k FROM Kurs k")
public class Kurs implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int kursid;

	private String ishod;

	private String naziv;

	private String opis;

	//bi-directional many-to-one association to Komentar
	@OneToMany(mappedBy="kur", fetch=FetchType.EAGER)
	private List<Komentar> komentars;

	//bi-directional many-to-many association to User
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(
		name="predaje"
		, joinColumns={
			@JoinColumn(name="KURSID")
			}
		, inverseJoinColumns={
			@JoinColumn(name="USERID")
			}
		)
	private List<User> users1;

	//bi-directional many-to-many association to User
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(
		name="prijavljen"
		, joinColumns={
			@JoinColumn(name="KURSID")
			}
		, inverseJoinColumns={
			@JoinColumn(name="USERID")
			}
		)
	private List<User> users2;

	//bi-directional many-to-one association to Lekcija
	@OneToMany(mappedBy="kur", fetch=FetchType.EAGER)
	private List<Lekcija> lekcijas;

	//bi-directional many-to-one association to Ocena
	@OneToMany(mappedBy="kur", fetch=FetchType.EAGER)
	private List<Ocena> ocenas;

	//bi-directional many-to-one association to Test
	@OneToMany(mappedBy="kur", fetch=FetchType.EAGER)
	private List<Test> tests;

	//bi-directional many-to-one association to Uradjentest
	@OneToMany(mappedBy="kur", fetch=FetchType.EAGER)
	private List<Uradjentest> uradjentests;

	public Kurs() {
	}

	public int getKursid() {
		return this.kursid;
	}

	public void setKursid(int kursid) {
		this.kursid = kursid;
	}

	public String getIshod() {
		return this.ishod;
	}

	public void setIshod(String ishod) {
		this.ishod = ishod;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public String getOpis() {
		return this.opis;
	}

	public void setOpis(String opis) {
		this.opis = opis;
	}

	public List<Komentar> getKomentars() {
		return this.komentars;
	}

	public void setKomentars(List<Komentar> komentars) {
		this.komentars = komentars;
	}

	public Komentar addKomentar(Komentar komentar) {
		getKomentars().add(komentar);
		komentar.setKur(this);

		return komentar;
	}

	public Komentar removeKomentar(Komentar komentar) {
		getKomentars().remove(komentar);
		komentar.setKur(null);

		return komentar;
	}

	public List<User> getUsers1() {
		return this.users1;
	}

	public void setUsers1(List<User> users1) {
		this.users1 = users1;
	}

	public List<User> getUsers2() {
		return this.users2;
	}

	public void setUsers2(List<User> users2) {
		this.users2 = users2;
	}

	public List<Lekcija> getLekcijas() {
		return this.lekcijas;
	}

	public void setLekcijas(List<Lekcija> lekcijas) {
		this.lekcijas = lekcijas;
	}

	public Lekcija addLekcija(Lekcija lekcija) {
		getLekcijas().add(lekcija);
		lekcija.setKur(this);

		return lekcija;
	}

	public Lekcija removeLekcija(Lekcija lekcija) {
		getLekcijas().remove(lekcija);
		lekcija.setKur(null);

		return lekcija;
	}

	public List<Ocena> getOcenas() {
		return this.ocenas;
	}

	public void setOcenas(List<Ocena> ocenas) {
		this.ocenas = ocenas;
	}

	public Ocena addOcena(Ocena ocena) {
		getOcenas().add(ocena);
		ocena.setKur(this);

		return ocena;
	}

	public Ocena removeOcena(Ocena ocena) {
		getOcenas().remove(ocena);
		ocena.setKur(null);

		return ocena;
	}

	public List<Test> getTests() {
		return this.tests;
	}

	public void setTests(List<Test> tests) {
		this.tests = tests;
	}

	public Test addTest(Test test) {
		getTests().add(test);
		test.setKur(this);

		return test;
	}

	public Test removeTest(Test test) {
		getTests().remove(test);
		test.setKur(null);

		return test;
	}

	public List<Uradjentest> getUradjentests() {
		return this.uradjentests;
	}

	public void setUradjentests(List<Uradjentest> uradjentests) {
		this.uradjentests = uradjentests;
	}

	public Uradjentest addUradjentest(Uradjentest uradjentest) {
		getUradjentests().add(uradjentest);
		uradjentest.setKur(this);

		return uradjentest;
	}

	public Uradjentest removeUradjentest(Uradjentest uradjentest) {
		getUradjentests().remove(uradjentest);
		uradjentest.setKur(null);

		return uradjentest;
	}

}