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
		<form action="/PrisWEB/PitanjaServlet" class="form-horizontal" method="post">
			<%
			if (kurs != null && logged){
				if (user.isPredavac()){
					String prazan = "";
			%>
			<div class="form-group">
				<label for="txt" class="control-label col-sm-2">Tekst pitanja(tekstualno pitanje) </label>
				<div class="col-sm-5">
						<input type="text" name="txt" value="${naslov != null ? ime : prazan}" id="txt" class="form-control">
				</div>
			</div>
			<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-success" value="Kreiraj Tekstualno Pitanje">
					</div>
			</div>
			
			<div class="form-group">	
				<label for=""txtizbor"" class="control-label col-sm-2">Tekst za izborno pitanje </label>
				<div class="col-sm-5">
						<input type="txtizbor" name="opis" value="${opis != null ? ime : prazan}" id=""txtizbor"" class="form-control">
				</div>
			</div>
			<div class="form-group">	
				<label for="txtizbor1" class="control-label col-sm-2">Izbor 1 </label>
				<div class="col-sm-5">
						<input type="txtizbor1" name="opis" value="${opis != null ? ime : prazan}" id="txtizbor1" class="form-control">
				</div>
				<input type="checkbox" name="tacan1" value="tacan">tacan
			</div>
			<div class="form-group">	
				<label for="txtizbor2" class="control-label col-sm-2">Izbor 2 </label>
				<div class="col-sm-5">
						<input type="txtizbor2" name="opis" value="${opis != null ? ime : prazan}" id="txtizbor2" class="form-control">
				</div>
				<input type="checkbox" name="tacan2" value="tacan">tacan
			</div>
			<div class="form-group">	
				<label for="txtizbor3" class="control-label col-sm-2">Izbor 3 </label>
				<div class="col-sm-5">
						<input type="txtizbor3" name="opis" value="${opis != null ? ime : prazan}" id="txtizbor3" class="form-control">
				</div>
				<input type="checkbox" name="tacan3" value="tacan">tacan
			</div>
			<div class="form-group">	
				<label for=""txtizbor4"" class="control-label col-sm-2">Izbor 4 </label>
				<div class="col-sm-5">
						<input type="txtizbor4" name="opis" value="${opis != null ? ime : prazan}" id="txtizbor4" class="form-control">
				</div>
				<input type="checkbox" name="tacan4" value="tacan">tacan
			</div>
			<div class="form-group">
					<input type="checkbox" name="viseOdgvora" value="viseOdgovora">Vise Odgovora?
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-success" value="Kreiraj pitanje sa izborom">
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