package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.TestBeanLocal;
import model.Kurs;
import model.Test;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@EJB
	TestBeanLocal testBean;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String naslov = request.getParameter("naslov");
		String opis = request.getParameter("opis");
		Kurs kurs = (Kurs)request.getSession().getAttribute("kurs");
	
		RequestDispatcher rd = null;
		rd = getServletContext().getRequestDispatcher("/add-test.jsp");
		doGet(request, response);
		System.out.println("Stigo sam dovde1");
		
		//Kreira novi test i stavlja ga u sesiju da bi mogo dodati pitanja
		Test t = testBean.noviTest(naslov, opis, kurs);
		if(t!=null){
			System.out.println("Stigo sam dovde");
			rd = getServletContext().getRequestDispatcher("/add-pitanja.jsp");
			request.getSession().setAttribute("test", t);
			rd.forward(request, response);
		}
		
		
		
		rd.forward(request, response);
	}

}
