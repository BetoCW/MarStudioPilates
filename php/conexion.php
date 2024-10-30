<?php
$host = "localhost";
$usuario = "root";
$password = "";
$base_datos = "marpilatesdatabase";

// Crear conexión
$conexion = new mysqli($host, $usuario, $password, $base_datos);

// Verificar conexión
if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}
?>
