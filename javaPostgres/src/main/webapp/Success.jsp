<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form action="index.jsp">

	<h3>
	
		<%= request.getParameter("msg")%>
		Operacion Exitosa
	
	
	</h3>
	
	
	<br>
	<input type="submit" value="Inicio">
	
	</form>

</body>
</html>