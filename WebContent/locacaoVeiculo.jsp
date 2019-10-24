<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Locacao de veiculos</title>
</head>
<body>
	<h1>Locacao de Veiculos</h1>
	<form action="verifica.jsp" method="post">
		<table>
			<tr>
				<td>Km Saida:</td>
				<td><input type="text" name="kmSaida"></td>
			</tr>
			<tr>
				<td>Km Chegada:</td>
				<td><input type="text" name="kmChegada"></td>
			</tr>
			<tr>
				<td>Valor por KM:</td>
				<td><input type="text" name="valor"></td>
			</tr>
			<tr>
				<td>Destino:</td>
				<td><input type="text" name="destino"></td>
			</tr>
			<tr>
			<td>Data de Nascimento:</td>
			<td><input type="text" name="dataNascimento"></td>

			</tr>
			<tr>
				<td>Veiculo:</td>
				<td><select name="veiculo">
						<option value="">Selecione</option>
						<option value="1">FordKA</option>
						<option value="2">Gol</option>
						<option value="3">HRV</option>
						<option value="4">Creta</option>
				</select></td>
			</tr>
			<tr>
				<td><input type="submit" name="cadastrar"></td>
			</tr>
		</table>
	</form>
</body>
</html>