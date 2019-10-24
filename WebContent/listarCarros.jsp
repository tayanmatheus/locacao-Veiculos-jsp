<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carros ja cadastrados</title>
</head>
<body>
<h3>Carros ja cadastrados:</h3>
<h3><%=session.getAttribute("carros") %></h3>
<a href="locacaoVeiculo.jsp">Cadastrar novo Carro</a>
</body>
</html>