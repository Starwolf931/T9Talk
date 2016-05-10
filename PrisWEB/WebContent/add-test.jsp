<%@page import="model.Test"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="model.Kurs"%>
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
		<form action="/PrisWEB/KursServlet" method="post" class="form-horizontal">
			<div class="form-group">
			<h3>Kurs <%=kurs.getNaziv() %>
				<input type="submit" class="btn btn-info btn-lg" name="<%=kurs.getKursid() %>" value="Prikazi">
			</h3>
			</div>
		</form>
		<form action="/PrisWEB/TestServlet" class="form-horizontal" method="post">
			<%
			if (kurs != null && logged){
				if (user.isPredavac()){
					String prazan = "";
			%>
			<div class="form-group">
				<label for="naslov" class="control-label col-sm-2">Naslov </label>
				<div class="col-sm-5">
						<input type="text" name="naslov" value="${naslov != null ? ime : prazan}" id="naslov" class="form-control">
				</div>
			</div>
			<div class="form-group">	
				<label for="opis" class="control-label col-sm-2">Opis </label>
				<div class="col-sm-5">
						<input type="text" name="opis" value="${opis != null ? ime : prazan}" id="opis" class="form-control">
				</div>
			</div>
			<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-success" value="Kreiraj">
					</div>
			</div>	
			<%
				}
			}else{
			%>
			Doslo je do greske!
			<%
			}
			%>
		</form>
	</div>
</div>
</body>
</html>