<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

<form name="formulario" action="SelectDetails" method="get" onsubmit="return validarFormulario();">
    <table>
        <tr>
            <td>ID:</td>
            <td><input type="text" name="id" maxlength="6" size="35" /></td>
        </tr>
    </table>
    <br />
    <input type="submit" value="Ver datos" />
</form>
<br />
<input type="button" value="Inicio" onclick="window.location.href='index.jsp'" />

</body>
</html>
