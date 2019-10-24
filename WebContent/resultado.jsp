<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
String kmSaida = (String) request.getAttribute("kmSaidaParam");
String kmChegada = (String) request.getAttribute("kmChegadaParam");
String valor = (String) request.getAttribute("valorParam");
String destino = (String) request.getAttribute("destinoParam");
String veiculo = (String) request.getAttribute("veiculoParam");
Double valorPorKm = (Double) request.getAttribute("valorPorKm");
Integer idade = (Integer) request.getAttribute("idadeParam");
Double valorIdade = (Double) request.getAttribute("valorIdade");
%>
<meta charset="ISO-8859-1">
<title>Resultado</title>
</head>
<body>
<h1>Resultado</h1>
<h1>Km Saida:<%=kmSaida %></h1>
<h1>km Chegada: <%=kmChegada %></h1>
<h1>Valor por Km:<%=valor %></h1>
<h1>Destino:<%=destino %></h1>
<h1>Veiculo:<%=veiculo %></h1>
<h1>Valor Final: <%=valorPorKm %></h1>
<h1>Idade da pessoa: <%=idade %></h1>
<%
if(valorIdade != null) { %>
<h1>Valor Com desconto por Idade: <%=valorIdade %></h1>
<%}%>
<a href="listarCarros.jsp">Listar Carros ja cadastrados</a>
<%
//Array para armarazenar mensagens
ArrayList<String> carros = new ArrayList<String>();
//sessao de verificacao
if(session.getAttribute("carros") != null){
	
	carros = (ArrayList<String>) session.getAttribute("carros");
}

	carros.add("<br />Carro: " + veiculo + " valor final: "+ valorPorKm);
	session.setAttribute("carros", carros);
	//verificacao de campo vazio, caso esteja direciona para pagina inicial novamente
	//if (email.equals("") || mensagem.equals("")) {

		//pageContext.forward("novaMensagem.jsp");

	//}
	
%>

</body>
</html>