<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
    function validarFormulario() {
        
        let regexID = /^\d{1,6}$/; 
        let regexNombreApellido = /^[a-zA-Z\s]{1,40}$/; 
        let regexEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; 

        
        let id = document.forms["formulario"]["id"].value;
        let nombre = document.forms["formulario"]["nombre"].value;
        let apellido = document.forms["formulario"]["apellido"].value;
        let email = document.forms["formulario"]["email"].value;

        
        if (!regexID.test(id)) {
            alert("Por favor ingrese un ID válido de hasta 6 dígitos");
            return false;
        }

       
        if (!regexNombreApellido.test(nombre)) {
            alert("Por favor ingrese un Nombre válido, solo letras y espacios, hasta 40 caracteres");
            return false;
        }

        
        if (!regexNombreApellido.test(apellido)) {
            alert("Por favor ingrese un Apellido válido, solo letras y espacios, hasta 40 caracteres");
            return false;
        }

        
        if (!regexEmail.test(email)) {
            alert("Por favor ingrese un Email válido");
            return false;
        }

        
        return true;
    }
</script>
</head>
<body>

<h2> Complete los campos para el Usuario</h2>

<form name="formulario" action="InsertDetails" method="post" onsubmit="return validarFormulario();">

    <table>
        <tr>
            <td>ID:</td>
            <td><input type="text" name="id" maxLength="6" size="35"></td>
        </tr>
        <tr>
            <td>Nombre:</td>
            <td><input type="text" name="nombre" maxLength="40" size="35"></td>
        </tr>
        <tr>
            <td>Apellido:</td>
            <td><input type="text" name="apellido" maxLength="40" size="35"></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="text" name="email" maxLength="40" size="35"></td>
        </tr>
    </table>

    <br>
    <input type="submit" value="Insertar Datos"/>

</form>

<br>

<input type="button" value="Regresar" onclick="window.location.href='index.jsp'">

</body>
</html>
