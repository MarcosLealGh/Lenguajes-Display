<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalles del Lenguaje</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container mt-5">
        <h1>Detalles del Lenguaje</h1>
        <div class="row">
            <div class="col-md-6">
                <h4>Nombre del Lenguaje:</h4>
                <p>${lenguaje.name}</p>
            </div>
            <div class="col-md-6">
                <h4>Creador:</h4>
                <p>${lenguaje.creator}</p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <h4>Versión Actual:</h4>
                <p>${lenguaje.currentVersion}</p>
            </div>
        </div>
        <!-- Agrega un botón para volver a la lista de lenguajes -->
        <a href="/lenguajes" class="btn btn-primary">Volver a la Lista de Lenguajes</a>
    </div>
</body>
</html>
