<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edición de Perfil</title>
</head>
<body>
    <h1>Edición de Perfil</h1>
    <form action="editarPerfil" method="post">
        Nombre: <input type="text" name="nombre" value="${perfil.nombre}" required><br><br>
        <input type="hidden" name="id" value="${perfil.id}">
        <input type="submit" value="Guardar Cambios">
    </form>
</body>
</html>
