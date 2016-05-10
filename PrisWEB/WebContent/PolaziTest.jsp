 <%@page import="model.Test"%>
<%@page import="model.Lekcija"%>
<%@page import="model.Komentar"%>
<%@page import="model.Ocena"%>
<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="beans.KursBeanLocal"%>
<%@page import="model.Kurs"%>
<%@page import="beans.UserBeanRemote"%>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container"> 
	<% 
	UserBeanRemote user = (UserBeanRemote)request.getSession().getAttribute("user");
	Kurs kurs = (Kurs)request.getSession().getAttribute("kurs");
	InitialContext ic = null;
	try {
		ic = new InitialContext();
		//kursBean = (KursBeanLocal) ic.lookup("java:global/PrisEAR/PrisEJB/KursBean!beans.KursBeanLocal");
	} catch (NamingException e) {
		e.printStackTrace();
	}
	boolean logged = false;
	if (user != null){
		logged = true;
	}
	%>
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
			    	<a class="navbar-brand" href="index.jsp">Talk</a>
			    </div>
			    <ul class="nav navbar-nav">
			    	<li class="active"><a href="index.jsp">Home</a></li>
			    	<%
			    	if (!logged){
			    	%>
			    		<li><a href="login.jsp">Login</a></li>
			    		<li><a href="register.jsp">Register</a></li>
			    	<%
			    	}
			    	if (logged && user.isAdmin()){
		    		%>
		    			<li><a href="admin.jsp">Admin Panel</a></li>
		    		<%
			    	}
			    	%>
				</ul>
	    	</div>
		</nav>
		<div class="col-sm-12">
			<h2>Header</h2>
			<%
			if (kurs != null && logged){
				Test test = (Test)request.getAttribute("Test");
			%>
			
			<!-- Naziv kursa i dugme koje vraca nazad na kurs -->
			
			
			
			
			<%
			}else{
			%>
			Doslo je do greske!
			<%
			}
			%>
		</div>
	</div>
</body>
</html>