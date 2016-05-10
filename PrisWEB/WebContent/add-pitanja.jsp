<%@page import="model.Pitanje"%>
<%@page import="model.Test"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="model.Kurs"%>
<%@page import="java.util.List"%>
<%@page import="beans.UserBeanRemote"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="starrating/jquery.rating.css">
<script src="starrating/jquery.js"></script>
<script src="starrating/jquery.rating.js"></script>
<script src="starrating/jquery.MetaData.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Talk - skola stranih jezika</title>
</head>
<body>
<div class="container">
	<%
	UserBeanRemote user = (UserBeanRemote)request.getSession().getAttribute("user");
	Kurs kurs = (Kurs)request.getSession().getAttribute("kurs");
	Test test = (Test)request.getSession().getAttribute("test");
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
		<form action="/PrisWEB/TestServlet" method="post">
			<h2>Pitanja &nbsp;&nbsp;
			<thead>
				<th>Text</th>
				<th>Izmeni</th>
				<th>Obrisi</th>
			</thead>
			<tbody>
				<%
				if(request.getAttribute("pitanja") != null){
					for (Pitanje pitanje : (List<Pitanje>)request.getAttribute("pitanja")){
				%>
				<tr>
					<td><%=pitanje.getText() %></td>
					<td><input type="submit" class="btn btn-warning" value="Izmeni" name="<%=pitanje.getPitanjeid() %>"></td>
					<td><input type="submit" class="btn btn-warning" value="Obrisi" name="<%=pitanje.getPitanjeid() %>"></td>
				</tr>
				<%
					}
				}
				%>
			</tbody>
			<a class="btn btn-success" href="novo-pitanje.jsp">Dodaj Pitanje</a> <br>
		</form>
	</div>
</div>
</body>
</html>