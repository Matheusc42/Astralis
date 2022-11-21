<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%> 
<%@page import="DAO.FuncionarioDAO"%> 
<%@page import="model.Funcionario"%>
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="./Js/modal.js"></script>
    <link rel="stylesheet" href="./CSS/modal.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Visão Geral Funcionario</title>
  </head>
  <body>
  <%
      //Resgatando o parametro de msg da sessao.
      String msg = (String) request.getSession().getAttribute("msg");

      //Resgatando o Id do Usuario atual
      int IdReg = Integer.parseInt(request.getParameter("IdReg"));

      //Criando objeto funcionario de parametro de entrada com o Id atual
      Funcionario funcParam = new Funcionario();
      funcParam.setIdReg(IdReg);

      //Armazenando em um objeto funcionario os dados sobre o funcionario atual
      Funcionario currentFunc = FuncionarioDAO.getOneEmployeeById(funcParam);
  %>
  <div class="modalBG" id="modal" >
    <div class="modalContainer">
      <h2>Conceder Acesso</h2>
      <hr />
      <div class="formContainer">
        <form action="Funcionario?action=novoAcesso&IdReg=<%out.print(currentFunc.getIdReg());%>" method="post">
          <input type="text" name="userName" id="userName" placeholder="Nome de Usuario" required/><br />
          <input type="submit" value="Criar Usuario" /> <br />
        </form>
          <button onclick="closeModal()"> Cancelar </button>
      </div>
    </div>
  </div>


  <a href="gerenciarFuncionarios.jsp"> <button> Voltar </button> </a>
    <h1>Funcionario: Visão Geral</h1>

    <form action="Funcionario?action=atualizarFuncionario&IdReg=<%out.print(currentFunc.getIdReg());%>" method="post">
      Id
      <input type="text" name="IdReg" value ="<%out.print(currentFunc.getIdReg());%>" readonly>
      <br />
      Nome: 
      <input type="text" name="Name" value ="<%out.print(currentFunc.getName());%>"/> 
      <br />
      RG: 
      <input type="text" name="RG" value ="<%out.print(currentFunc.getRG());%>"/> 
      <br />
      CPF: 
      <input type="text" name="CPF" value ="<%out.print(currentFunc.getCPF());%>"/> 
      <br />
      Data de Nascimento: 
      <input type="date" name="BirthDate" value ="<%out.print(currentFunc.getBirthDate());%>"/> 
      <br />
      Celular: 
      <input type="text" name="MobilePhone" value ="<%out.print(currentFunc.getMobilePhone());%>"/> 
      <br />
      Telefone: 
      <input type="text" name="Phone" value ="<%out.print(currentFunc.getPhone());%>"/> 
      <br />
      Email: 
      <input type="text" name="Mail" value ="<%out.print(currentFunc.getMail());%>"/> 
      <br />
      CEP: 
      <input type="text" name="CEP" value ="<%out.print(currentFunc.getCEP());%>"/> 
      <br />
      Endereço: 
      <input type="text" name="Address" value ="<%out.print(currentFunc.getAddress());%>"/> 
      <br />
      N°: 
      <input type="text" name="Number" value ="<%out.print(currentFunc.getNumber());%>"/> 
      <br />
      Bairro: 
      <input type="text" name="District" value ="<%out.print(currentFunc.getDistrict());%>"/> 
      <br />
      Cidade: 
      <input type="text" name="City" value ="<%out.print(currentFunc.getCity());%>"/> 
      <br />
      Estado:
      <select id="estado" name="UF" value ="<%out.print(currentFunc.getUF());%>">
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
      Cargo: 
       <select name="Position" required disabled value ="<%out.print(currentFunc.getPosition());%>">
        <option value=""></option>
        <option value="Direção">Direção</option>
        <option value="Coordenção">Coordenação</option>
        <option value="Docente">Docente</option>
        <option value="Secretário">Secretário</option>
      </select>
      <br />
      Formação: 
      <input type="text" name="Graduation"  value ="<%out.print(currentFunc.getGraduation());%>"/> 
      <br />
      <input type="submit" value="Salvar Dados" />
    </form>
    <%
      if(msg != null && msg.equals("userCreate")){
          out.print("<br> Usuario criado com sucesso <br>");
          request.getSession().removeAttribute("msg");
      } else if (msg != null && msg.equals("userAlreadyExist")){
          out.print("<br> Usuario já existe, informe outro <br>");
          request.getSession().removeAttribute("msg");
      }
    %>
    <button onclick="openModal()">Conceder Acesso</button>
  </body>
</html>
