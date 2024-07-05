<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f8ff; /* Color de fondo */
        padding: 20px;
    }
    h2 {
        color: #008000; /* Verde */
    }
    form {
        background-color: #ffffe0; /* Amarillo claro */
        padding: 20px;
        border-radius: 10px;
        width: 300px;
        margin: auto;
    }
    input[type="text"], input[type="submit"] {
        width: calc(100% - 20px);
        padding: 8px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    input[type="submit"] {
        background-color: #008000; /* Verde */
        color: white;
        border: none;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #006400; /* Verde oscuro */
    }
</style>
</head>
<body>
<hr>
    
       
	<form action="PerfilServlet" method="post">
	<h2>Editar Perfil</h2>
	   <input type="hidden" name="action" value="actualizar">
	   <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
	   <%-- Verificar si perfilEditar es de tipo Perfil antes de acceder a sus métodos --%>
	   <% Object perfilEditarObject = request.getAttribute("perfilEditar"); %>
	   <% if (perfilEditarObject instanceof Modelos.Perfil) { %>
	       <% Modelos.Perfil perfilEditar = (Modelos.Perfil) perfilEditarObject; %>
	       Nombre: <input type="text" name="nomcl3" value="<%= perfilEditar.getNombre() %>"><br>        
	   <% } else { %>
	       <p>Error: El perfil a editar no es válido.</p>
	   <% } %>
	   <input type="submit" value="Actualizar">
	</form>
</body>
</html>