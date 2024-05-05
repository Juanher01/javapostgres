<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h2 align="center"> Administrador de Estudiantes</h2>

<br>


<table align="center">

	<tr>
		<td>Para Insertar registro:</td>
		<td><input type="button" value="Agregar" onclick="window.location.href = 'Insert.jsp'"></td>
	
	</tr>
	
		<tr>
		<td>Para Eliminar registro:</td>
		<td><input type="button" value="Eliminar" onclick="window.location.href = 'Delete.jsp'"></td>
	
	</tr>
	
		<tr>
		<td>Para Ver Información:</td>
		<td><input type="button" value="Ver informacion" onclick="window.location.href = 'Select.jsp'"></td>
	
	</tr>


</table>

</body>
</html>