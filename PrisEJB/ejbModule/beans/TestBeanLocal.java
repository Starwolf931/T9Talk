package beans;

import java.util.List;

import javax.ejb.Local;

import model.Kurs;
import model.Lekcija;
import model.Test;
import model.User;

@Local
public interface TestBeanLocal {

	public Test noviTest(String naslov , String opis,Kurs kurs);
	public Test getTestForID(int id);
	public List<Test> getTestovi(Kurs kurs);
	public boolean updateTest(Test test);
	public boolean novoPitanje(String text, int tipOdgovora,Test test,String odgovorTxt );
}
