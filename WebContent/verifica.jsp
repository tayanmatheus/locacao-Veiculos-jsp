
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.lang.model.util.SimpleAnnotationValueVisitor6"%>
<%
	String kmSaida = request.getParameter("kmSaida");
	String kmChegada = request.getParameter("kmChegada");
	String valor = request.getParameter("valor");
	String destino = request.getParameter("destino");
	String veiculo = request.getParameter("veiculo");
	String dataNascimento = request.getParameter("dataNascimento");
	
	//verificacao de validacao
	String mensagem = "";

	if (kmSaida.equals("")) {

		mensagem = "O camo Km Saida esta vazio </br >";
	}
	if (kmChegada.equals("")) {

		mensagem += "O campo Km Chegada esta vazio <br />";
	}
	if (valor.equals("")) {

		mensagem += "O campo valor por km esta vazio <br />";
	}
	if (destino.equals("")) {

		mensagem += "O campo destino esta vazio <br />";
	}
	if (veiculo.equals("")) {

		mensagem += "O campo veiciulo nao foi selecionado <br />";
	}

	if (mensagem.equals("")) {

		Double valorPorKm = Double.parseDouble(valor);
		Double KmDeSaida = Double.parseDouble(kmSaida);
		Double KmDeChegada = Double.parseDouble(kmChegada);
		Double Distancia = 0.0;
		Double valorIdade = Double.parseDouble(valor);
		//conta pra achar distancia
		Distancia = KmDeChegada - KmDeSaida;
		valorPorKm = valorPorKm * Distancia;
		
		if (veiculo.equals("1")) {

			valorPorKm = valorPorKm - (valorPorKm * 0.07);

		}
		if (veiculo.equals("3")) {

			valorPorKm = valorPorKm + (valorPorKm * 0.03);

		}

		if (Distancia >= 500) {

			valorPorKm = valorPorKm - (valorPorKm * 0.02);
		}
		//1 SimpleDateFormat dataBrasil = new SimpleDateFormat("dd/MM/yyyy");2 String dataFormatBrasil = dataBrasil.format(dataAtual); <- formata a Date dataAtual no simple

		//Transformar data em idade :
		//Formatando a data em padrao dd/MM/yyyy
		SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
		Date dataAtual = new Date();
		//Pegando a data digitada e formatando ela no padrao format
		Date dataInicio = formatador.parse(dataNascimento);
		//Criando uma data de referencia
		Date dataReferencia = formatador.parse("10/05/1992");
		int idade = 0;
		
		long diferencaDias = (dataAtual.getTime() - dataInicio.getTime()) / 1000 / 60 / 60 / 24 / 365; // acha quantidae em ano, se fose ate 24 achava quantidade de dias
		
		idade = (int) diferencaDias;
		
		
		
		if(idade >= 20) {
			 //para pegar uma data como referencia e fazer condicao, como "apos tal data desconto de 7%"
			if(dataInicio.after(dataReferencia)) {
				
				valorIdade = (valorIdade - (valorIdade * 0.1));
			}
			
		}
		
		
		request.setAttribute("kmSaidaParam", kmSaida);
		request.setAttribute("kmChegadaParam", kmChegada);
		request.setAttribute("valorParam", valor);
		request.setAttribute("destinoParam", destino);
		request.setAttribute("valorPorKm", valorPorKm);
		request.setAttribute("idadeParam", idade);
		request.setAttribute("valorIdade", valorIdade);
		if (veiculo.equals("1")) {

			request.setAttribute("veiculoParam", "FordKA");
		}

		if (veiculo.equals("2")) {

			request.setAttribute("veiculoParam", "Gol");
		}
		if (veiculo.equals("3")) {

			request.setAttribute("veiculoParam", "HRV");
		}
		if (veiculo.equals("4")) {

			request.setAttribute("veiculoParam", "Creta");
		}
		pageContext.forward("resultado.jsp");
	} else {

		request.setAttribute("mensagemParam", mensagem);
		pageContext.forward("dadosInconsistente.jsp");
	}
%>