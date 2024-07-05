<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="Modelos.Perfil" %>
<!DOCTYPE html>
<html>
<head>

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

    <meta charset="UTF-8">

    <!-- Formulario para registrar un nuevo Perfil -->
    
    <form action="PerfilServlet" method="post">
    <h2>Registrar Perfil</h2>
        Nombre: <input type="text" name="nomcl3"><br>        
        <input type="submit" value="Registrar">
    </form>
    
<hr>

    <title>Listado de Perfil</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            margin: 20px;
        }
        .container {
            max-width: 800px;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #4CAF50; /* Verde principal */
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50; /* Verde principal */
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2; /* Fondo gris claro */
        }
        .actions a {
            text-decoration: none;
            padding: 5px 10px;
            background-color: #fdd835; /* Amarillo */
            color: #333;
            border-radius: 4px;
        }
        .actions a:hover {
            background-color: #ffee58; /* Amarillo claro al pasar el mouse */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Listado de Perfil</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
 <%-- Iterar sobre la lista de Perfil y mostrar cada uno --%>
             <%-- Convertir la respuesta JSON a una lista de Perfil --%>
            <%
                String PerfilJson = (String) request.getAttribute("perfiles");              
                Gson gson = new Gson();
                Perfil[] Perfil = gson.fromJson(PerfilJson, Perfil[].class);
              for (Perfil c : Perfil) {
            %>
                    <tr>
                        <td><%= c.getIdPerfil() %></td>
                        <td><%= c.getNombre() %></td>                        
                        <td class="actions">
                            <a href="PerfilServlet?id=<%= c.getIdPerfil()%>&action=editar&nombre=<%= c.getNombre()%>">Editar</a>
                            <a href="PerfilServlet?id=<%= c.getIdPerfil()%>&action=eliminar">Eliminar</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <br>        
    </div>
</body>
</html>
	