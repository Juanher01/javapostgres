<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Resultado</title>
</head>
<body>

    <h2>Detalles</h2>

    <form>
        <input type="hidden" name="stid" value="<%=request.getParameter("id")%>">
        <input type="hidden" name="nombre" value="<%=request.getParameter("nombre")%>">
        <input type="hidden" name="apellido" value="<%=request.getParameter("apellido")%>">
        <input type="hidden" name="email" value="<%=request.getParameter("email")%>">

        <table>
            <tr>
                <td>ID:</td>
                <td><%=request.getParameter("id")%></td>
            </tr>
            <tr>
                <td>Nombre:</td>
                <td><%=request.getParameter("nombre")%></td>
            </tr>
            <tr>
                <td>Apellido:</td>
                <td><%=request.getParameter("apellido")%></td>
            </tr>
            <tr>
                <td>Email :</td>
                <td><%=request.getParameter("email")%></td>
            </tr>
            <tr />
        </table>
        <br />
    </form>
    <br />
    <input type="button" value="Actualizar datos" onclick="update()" />
    <br />
    <input type="button" value="Inicio" onclick="window.location.href='Home.jsp'" />

</body>

<script language="javascript" type="text/javascript">
    function update() {
        var sid = document.forms[0].elements['stid'].value;
        var nombre = document.forms[0].elements['nombre'].value;
        var apellido = document.forms[0].elements['apellido'].value;
        var email = document.forms[0].elements['email'].value;
        window.location.href = "Update.jsp?id=" + sid + "&nombre=" + nombre + "&apellido=" + apellido + "&email=" + email;
    }
</script>
</html>
