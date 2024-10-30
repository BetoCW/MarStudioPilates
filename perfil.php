<?php
session_start();

// Verificar si el usuario ha iniciado sesión
if (!isset($_SESSION['usuario'])) {
    header('Location: login.html'); // Redirige al login si no hay sesión
    exit();
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil del Usuario</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="animate-page.css">
</head>
<body>
    <!-- Navegación -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="index.html">Mar studio Pilates</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="index.html">Inicio</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="perfil.php">Perfil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="php/logout.php">Cerrar Sesión</a> <!-- Logout -->
                </li>
            </ul>
        </div>
    </nav>

    <!-- Contenido del Perfil -->
    <div class="container mt-5">
        <h2 class="text-center">Perfil del Usuario</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <h3><?php echo $_SESSION['usuario']; ?></h3>
                        <p><strong>Correo:</strong> <?php echo $_SESSION['correo']; ?></p>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <h3>Mis Compras</h3>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Paquete</th>
                            <th>Sesiones</th>
                            <th>Precio</th>
                            <th>Fecha de Compra</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Reformer - 5 Sesiones</td>
                            <td>5</td>
                            <td>$580.00</td>
                            <td>12/09/2023</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
