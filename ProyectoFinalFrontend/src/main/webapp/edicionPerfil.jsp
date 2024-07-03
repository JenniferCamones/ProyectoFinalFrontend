
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edición de Perfil</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        form {
            width: 300px;
            margin: 0 auto;
            background: #f9f9f9;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        input[type="text"], input[type="submit"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Edición de Perfil</h1>
    <form action="editarPerfil" method="post">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" value="${perfil.nombre}" required><br><br>
        <input type="hidden" name="id" value="${perfil.id}">
        <input type="submit" value="Guardar Cambios">
    </form>
</body>
</html>

        