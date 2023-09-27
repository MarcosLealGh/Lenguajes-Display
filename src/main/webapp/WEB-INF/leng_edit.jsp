<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Lenguaje</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-6 mx-auto text-center" >
    <!-- Formulario para editar un nuevo lenguaje -->
                    <form:form method="PUT" modelAttribute="lenguaje" action="/lenguajes/${lenguaje.id}">
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
				<input type="submit" value="Actualizar" class="btn btn-success mt-3" />
                    </form:form>
    <!-- Enlace para volver al listado de lenguajes -->
    <a href="/lenguajes"  class="btn btn-success mt-3" >Volver al Listado de Lenguajes</a>
    		</div>
   		 </div>
    </div>
</body>
</html>
