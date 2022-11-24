<%@page import="DAO.AlunoDAO"%>
<%@page import="model.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%> 

<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="./Js/modal.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Visão Geral Aluno</title>
  </head>
  <body>
  <%
      
      //Resgatando o Id do aluno atual
      int RM = Integer.parseInt(request.getParameter("RM"));

      //Criando objeto aluno de parametro de entrada com o Id atual
      Aluno alunoParam = new Aluno();
      alunoParam.setRM(RM);

      //Armazenando em um objeto funcionario os dados sobre o funcionario atual
      Aluno currentAluno = AlunoDAO.getOneStudentById(alunoParam);
  %>
  
  <a href="gerenciarFuncionarios.jsp"> <button> Voltar </button> </a>
    <h1>Aluno: Visão Geral</h1>

    <form action="Aluno?action=atualizarAluno&RM=<%out.print(currentAluno.getRM());%>" method="post">
      RM
      <input type="text" name="RM" value ="<%out.print(currentAluno.getRM());%>" readonly>
      <br />
      Nome: 
      <input type="text" name="Name" value ="<%out.print(currentAluno.getName());%>"/> 
      <br />
      RG: 
      <input type="text" name="RG" value ="<%out.print(currentAluno.getRG());%>"/> 
      <br />
      CPF: 
      <input type="text" name="CPF" value ="<%out.print(currentAluno.getCPF());%>"/> 
      <br />
      Certidão de Nascimento: 
      <input type="text" name="BirthCertificate" value ="<%out.print(currentAluno.getBirthCertificate());%>"/> 
      <br />
      Data de Nascimento: 
      <input type="date" name="BirthDate" value ="<%out.print(currentAluno.getBirthDate());%>"/> 
      <br />
      Nome da Mãe: 
      <input type="text" name="responsavelMae" value ="<%out.print(currentAluno.getResponsavelMae());%>"/> 
      <br />
      RG Mãe: 
      <input type="text" name="RGMae" value ="<%out.print(currentAluno.getRGMae());%>"/> 
      <br />
      CPF Mãe: 
      <input type="text" name="CPFMae" value ="<%out.print(currentAluno.getCPFMae());%>"/> 
      <br />
      Nome da Pai: 
      <input type="text" name="responsavelPai" value ="<%out.print(currentAluno.getResponsavelPai());%>"/> 
      <br />
      RG Pai: 
      <input type="text" name="RGMae" value ="<%out.print(currentAluno.getRGPai());%>"/> 
      <br />
      CPF Pai: 
      <input type="text" name="CPFMae" value ="<%out.print(currentAluno.getCPFPai());%>"/> 
      <br />
      Celular: 
      <input type="text" name="MobilePhone" value ="<%out.print(currentAluno.getMobilePhone());%>"/> 
      <br />
      Telefone: 
      <input type="text" name="Phone" value ="<%out.print(currentAluno.getPhone());%>"/> 
      <br />
      Email: 
      <input type="text" name="Mail" value ="<%out.print(currentAluno.getMail());%>"/> 
      <br />
      CEP: 
      <input type="text" name="CEP" value ="<%out.print(currentAluno.getCEP());%>"/> 
      <br />
      Endereço: 
      <input type="text" name="Address" value ="<%out.print(currentAluno.getAddress());%>"/> 
      <br />
      N°: 
      <input type="text" name="Number" value ="<%out.print(currentAluno.getNumber());%>"/> 
      <br />
      Bairro: 
      <input type="text" name="District" value ="<%out.print(currentAluno.getDistrict());%>"/> 
      <br />
      Cidade: 
      <input type="text" name="City" value ="<%out.print(currentAluno.getCity());%>"/> 
      <br />
      Estado:
      <select id="estado" name="UF" value ="<%out.print(currentAluno.getUF());%>">
        <option value=""></option>
        <option value="AC">Acre</option>
        <option value="AL">Alagoas</option>
        <option value="AP">Amapá</option>
        <option value="AM">Amazonas</option>
        <option value="BA">Bahia</option>
        <option value="CE">Ceará</option>
        <option value="DF">Distrito Federal</option>
        <option value="ES">Espírito Santo</option>
        <option value="GO">Goiás</option>
        <option value="MA">Maranhão</option>
        <option value="MT">Mato Grosso</option>
        <option value="MS">Mato Grosso do Sul</option>
        <option value="MG">Minas Gerais</option>
        <option value="PA">Pará</option>
        <option value="PB">Paraíba</option>
        <option value="PR">Paraná</option>
        <option value="PE">Pernambuco</option>
        <option value="PI">Piauí</option>
        <option value="RJ">Rio de Janeiro</option>
        <option value="RN">Rio Grande do Norte</option>
        <option value="RS">Rio Grande do Sul</option>
        <option value="RO">Rondônia</option>
        <option value="RR">Roraima</option>
        <option value="SC">Santa Catarina</option>
        <option value="SP">São Paulo</option>
        <option value="SE">Sergipe</option>
        <option value="TO">Tocantins</option>
        <option value="EX">Estrangeiro</option>
      </select>
      <br />
    <button onclick="openModal()">Atualizar</button>
  </body>
</html>
