<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Menú de Sistema</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f8ff; /* Color de fondo */
        padding: 20px;
        text-align: center;
    }
    .menu {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }
    .menu a {
        display: block;
        background-color: #008080; /* Turquesa */
        color: white;
        text-decoration: none;
        padding: 10px 20px;
        margin: 0 10px;
        border-radius: 5px;
        transition: background-color 0.3s;
    }
    .menu a:hover {
        background-color: #006666; /* Turquesa oscuro */
    }
    .content {
        max-width: 800px;
        margin: auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
</style>
</head>
<body>
    <h2>Bienvenido al Sistema</h2>
    
    <div class="menu">
        <a href="UsuariosServlet">Usuarios</a>
        <a href="PerfilServlet">Perfil</a>
        <a href="ProyectosServlet">Proyectos</a>
    </div>

    <div class="content">
        <!-- Aquí irá el contenido dinámico según la opción seleccionada -->
        <p>Contenido de la página principal.</p>
    </div>

</body>
</html>
