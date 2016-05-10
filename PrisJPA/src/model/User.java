package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the user database table.
 * 
 */
@Entity
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int userid;

	private String ime;

	private String password;

	private String prezime;

	private String username;

	//bi-directional many-to-one association to Komentar
	@OneToMany(mappedBy="user", fetch=FetchType.EAGER)
	private List<Komentar> komentars;

	//bi-directional many-to-many association to Kurs
	@ManyToMany(mappedBy="users1", fetch=FetchType.EAGER)
	private List<Kurs> kurs1;

	//bi-directional many-to-many association to Kurs
	@ManyToMany(mappedBy="users2", fetch=FetchType.EAGER)
	private List<Kurs> kurs2;

	//bi-directional many-to-one association to Lekcija
	@OneToMany(mappedBy="user", fetch=FetchType.EAGER)
	private List<Lekcija> lekcijas;

	//bi-directional many-to-one association to Ocena
	@OneToMany(mappedBy="user", fetch=FetchType.EAGER)
	private List<Ocena> ocenas;

	//bi-directional many-to-one association to Polaze
	@OneToMany(mappedBy="user", fetch=FetchType.EAGER)
	private List<Polaze> polazes;

	//bi-directional many-to-one association to Uradjentest
	@OneToMany(mappedBy="user", fetch=FetchType.EAGER)
	private List<Uradjentest> uradjentests;

	//bi-directional many-to-one association to UserRole
	@ManyToOne
	@JoinColumn(name="ROLEID")
	private UserRole userrole;

	public User() {
	}

	public int getUserid() {
		return this.userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getIme() {
		return this.ime;
	}

	public void setIme(String ime) {
		this.ime = ime;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPrezime() {
		return this.prezime;
	}

	public void setPrezime(String prezime) {
		this.prezime = prezime;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<Komentar> getKomentars() {
		return this.komentars;
	}

	public void setKomentars(List<Komentar> komentars) {
		this.komentars = komentars;
	}

	public Komentar addKomentar(Komentar komentar) {
		getKomentars().add(komentar);
		komentar.setUser(this);

		return komentar;
	}

	public Komentar removeKomentar(Komentar komentar) {
		getKomentars().remove(komentar);
		komentar.setUser(null);

		return komentar;
	}

	public List<Kurs> getKurs1() {
		return this.kurs1;
	}

	public void setKurs1(List<Kurs> kurs1) {
		this.kurs1 = kurs1;
	}

	public List<Kurs> getKurs2() {
		return this.kurs2;
	}

	public void setKurs2(List<Kurs> kurs2) {
		this.kurs2 = kurs2;
	}

	public List<Lekcija> getLekcijas() {
		return this.lekcijas;
	}

	public void setLekcijas(List<Lekcija> lekcijas) {
		this.lekcijas = lekcijas;
	}

	public Lekcija addLekcija(Lekcija lekcija) {
		getLekcijas().add(lekcija);
		lekcija.setUser(this);

		return lekcija;
	}

	public Lekcija removeLekcija(Lekcija lekcija) {
		getLekcijas().remove(lekcija);
		lekcija.setUser(null);

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
		ocena.setUser(this);

		return ocena;
	}

	public Ocena removeOcena(Ocena ocena) {
		getOcenas().remove(ocena);
		ocena.setUser(null);

		return ocena;
	}

	public List<Polaze> getPolazes() {
		return this.polazes;
	}

	public void setPolazes(List<Polaze> polazes) {
		this.polazes = polazes;
	}

	public Polaze addPolaze(Polaze polaze) {
		getPolazes().add(polaze);
		polaze.setUser(this);

		return polaze;
	}

	public Polaze removePolaze(Polaze polaze) {
		getPolazes().remove(polaze);
		polaze.setUser(null);

		return polaze;
	}

	public List<Uradjentest> getUradjentests() {
		return this.uradjentests;
	}

	public void setUradjentests(List<Uradjentest> uradjentests) {
		this.uradjentests = uradjentests;
	}

	public Uradjentest addUradjentest(Uradjentest uradjentest) {
		getUradjentests().add(uradjentest);
		uradjentest.setUser(this);

		return uradjentest;
	}

	public Uradjentest removeUradjentest(Uradjentest uradjentest) {
		getUradjentests().remove(uradjentest);
		uradjentest.setUser(null);

		return uradjentest;
	}

	public UserRole getUserrole() {
		return this.userrole;
	}

	public void setUserrole(UserRole userrole) {
		this.userrole = userrole;
	}

}