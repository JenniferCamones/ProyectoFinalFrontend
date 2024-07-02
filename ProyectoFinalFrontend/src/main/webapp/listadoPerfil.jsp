<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="Modelos.Perfil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Perfiles</title>
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
        <h1>Listado de Perfiles</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
 <%-- Iterar sobre la lista de perfiles y mostrar cada uno --%>
             <%-- Convertir la respuesta JSON a una lista de perfiles --%>
            <%
                String perfilesJson = (String) request.getAttribute("perfiles");              
                Gson gson = new Gson();
                Perfil[] perfiles = gson.fromJson(perfilesJson, Perfil[].class);
              for (Perfil perfil : perfiles) {
            %>
                    <tr>
                        <td><%= perfil.getIdPerfil() %></td>
                        <td><%= perfil.getNombre() %></td>
                        <td class="actions">
                            <a href="edicionPerfil.jsp?id=<%= perfil.getIdPerfil() %>">Editar</a>
                            <a href="eliminarPerfil?id=<%= perfil.getIdPerfil() %>">Eliminar</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <br>
        <a href="registroPerfil.jsp" style="text-decoration: none; display: block; text-align: center; padding: 10px; background-color: #4CAF50; color: white; border-radius: 4px;">Registrar Nuevo Perfil</a>
    </div>
</body>
</html>
