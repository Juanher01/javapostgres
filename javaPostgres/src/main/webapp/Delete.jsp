<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eliminar</title>
<script>
    function validarFormulario() {
        let regexID = /^\d{1,6}$/; 

        let id = document.forms["formulario"]["id"].value;

        
        if (!regexID.test(id)) {
            alert("Por favor ingrese un ID válido de hasta 6 dígitos");
            return false;
        }

        return true;
    }
</script>
</head>
<body>
<h2 align="center">ELIMINAR</h2>

<form name="formulario" action="DeleteDetails" method="post" align="center" onsubmit="return validarFormulario();">
    <table>
        <tr>
            <td>ID:</td>
            <td><input type="text" name="id" maxlength="6" size="25"></td>
        </tr>
    </table>
    <input type="submit" value="Eliminar registro"/>
</form>

<input type="button" value="Inicio" onclick="window.location.href= 'index.jsp'"/>

</body>
</html>
