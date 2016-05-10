package beans;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import model.Kurs;
import model.Lekcija;
import model.Odgovor;
import model.Pitanje;
import model.Test;

/**
 * Session Bean implementation class TestBean
 */
@Stateless
@LocalBean
public class TestBean implements TestBeanRemote, TestBeanLocal {

	@PersistenceContext
	EntityManager em;
	
    public TestBean() {
    	
    }
    
  //Kreria novi test
    public Test noviTest(String naslov , String opis,Kurs kurs){
    	System.out.println("TESTbun naslov"+naslov+"opis "+opis+"kurs "+kurs.getNaziv());
    	Test test = new Test();
    	test.setNaslov(naslov);
    	test.setOpis(opis);
    	test.setKur(kurs);
    	
    	try{
    		em.persist(test);
    		return test;
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return null;
    }
    
    //Vraca test za id
    public Test getTestForID(int id){
    	return em.find(Test.class, id);
    }
    
    //Vraca sve testove za kurs
    public List<Test> getTestovi(Kurs kurs){
    	List<Test> testovi = null;
    	TypedQuery<Test> query = em.createQuery("SELECT t FROM Test t WHERE t.kur = :kurs", Test.class);
    	query.setParameter("kurs", kurs);
    	
    	try{
    		testovi = query.getResultList();
    	}catch(NoResultException e){
    		return new ArrayList<Test>();
    	}
    	
    	return testovi;
    }
    
    //Update test
    public boolean updateTest(Test test){
    	try{
    		test = em.merge(test);
    	}catch(Exception e){
    		return false;
    	}
    	return true;
    }
    
    //Kreira pitanje
    public boolean novoPitanje(String text, int tipOdgovora,Test test,String odgovorTxt ){
    	Pitanje pitanje = new Pitanje();
    	pitanje.setTest(test);
    	pitanje.setText(text);
    	pitanje.setTipodgovora(tipOdgovora);
    	
    	Odgovor odgovor = new Odgovor();
    	odgovor.setPitanje(pitanje);
    	odgovor.setText(odgovorTxt);
    	odgovor.setTacan((byte) 0);
    	
    	try{
    		em.persist(pitanje);
    		return true;
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return false;
    }

}
