<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Lenguajes</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
</head>
<body>
    <div class="container mt-5">
        <h1>Listado de Lenguajes</h1>
        
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>
        
        <!-- Botón para abrir el formulario de creación de lenguaje -->
        <button type="button" class="btn btn-primary mb-3" data-toggle="modal" data-target="#crearLenguajeModal">
            Crear un Nuevo Lenguaje
        </button>
        
        <!-- Tabla para mostrar la lista de lenguajes -->
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Creador</th>
                    <th>Versión Actual</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${lenguajes}" var="lenguaje">
                    <tr>
                        <td>${lenguaje.id}</td>
                        <td><a href="/lenguajes/${lenguaje.id}">${lenguaje.name}</a></td>
                        <td>${lenguaje.creator}</td>
                        <td>${lenguaje.currentVersion}</td>
                        <td>
                         <!-- Enlaces para editar y eliminar lenguajes -->
                         <div>
                            <a href="/lenguajes/${lenguaje.id}/edit" class="btn btn-warning btn-sm">Editar</a>
                         </div>
                         <div>
                           <form method="POST" action="/lenguajes/${lenguaje.id}/delete">
						    <input type="hidden" name="_method" value="DELETE">
						    <input type="submit" class="btn btn-danger btn-sm" value="Eliminar" onclick="return confirm('¿Estás seguro de que deseas eliminar este lenguaje?')">
						   </form> 
						</div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
    <!-- Modal para crear lenguaje -->
    <div class="modal fade" id="crearLenguajeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Crear un Nuevo Lenguaje</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Formulario para crear un nuevo lenguaje -->
                    <form:form method="post" modelAttribute="lenguaje" action="/lenguajes/crear">
                    <div>
						<form:label path="name">Nombre</form:label>
						<form:input path="name" class="form-control" />
						<form:errors path="name" class="text-danger" />
					</div>
					<div>
						<form:label path="creator">Creador</form:label>
						<form:input path="creator" class="form-control" />
						<form:errors path="creator" class="text-danger" />
					</div>
					<div>
						<form:label path="currentVersion">Version</form:label>
						<form:input path="currentVersion" class="form-control" />
						<form:errors path="currentVersion" class="text-danger" />
					</div>
				<input type="submit" value="Registrarme" class="btn btn-success mt-3" />
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
