<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%> 
<%@page import="DAO.FuncionarioDAO"%> 
<%@page import="model.Funcionario"%>

<% 
       Funcionario user = (Funcionario) request.getSession().getAttribute("user");
       if(user == null) {
          response.sendRedirect("loginScreen.jsp");
       }
     %>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="./CSS/updateLayout.css">
    <script type="text/javascript" src="./Js/modal.js"></script>
    <link rel="stylesheet" href="./CSS/modal.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Astralis | Atualizar Dados</title>
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

    <header>
      <div class="logoContainer">
        <a href="mainMenu.jsp"><img src="./Assets/Logo_Branco.png"></a>
      </div>
      <div class="menuContainer">
        <a href="mainMenu.jsp">Inicio</a>
      </div>
      <div class="welcomeContainer">        
        <%out.print(" <p>Olá, " + user.getUser() + "<br>");%>
        Você esta logado como:<br>
        <%out.print(user.getPosition() + "</p>");%>
        <img src="./Assets/profile.png">
      </div>
      <div class="logoutContainer">
        <a href="Authentication?action=Logout"><img src="./Assets/logout.png"></a>
      </div>
    </header>

    <div class= "mainContainer">
        <div class = "contentContainer">
          <h1>Atualizar dados do funcionario</h1>
            <form action="Funcionario?action=atualizarFuncionario&IdReg=<%out.print(currentFunc.getIdReg());%>" method="post">
              <p>Id</p> <input type="text" name="IdReg" value ="<%out.print(currentFunc.getIdReg());%>" readonly>
              <p>Nome: </p> <input type="text" name="Name" value ="<%out.print(currentFunc.getName());%>"/> 
              <p>RG: </p> <input type="text" name="RG" value ="<%out.print(currentFunc.getRG());%>"/> 
              <p>CPF: </p> <input type="text" name="CPF" value ="<%out.print(currentFunc.getCPF());%>"/> 
              <p>Data de Nascimento: </p> <input type="date" name="BirthDate" value ="<%out.print(currentFunc.getBirthDate());%>"/> 
              <p>Celular: </p> <input type="text" name="MobilePhone" value ="<%out.print(currentFunc.getMobilePhone());%>"/> 
              <p>Telefone: </p> <input type="text" name="Phone" value ="<%out.print(currentFunc.getPhone());%>"/> 
              <p>Email: </p> <input type="text" name="Mail" value ="<%out.print(currentFunc.getMail());%>"/> 
              <p>CEP: </p> <input type="text" name="CEP" value ="<%out.print(currentFunc.getCEP());%>"/> 
              <p>Endereço: </p> <input type="text" name="Address" value ="<%out.print(currentFunc.getAddress());%>"/> 
              <p>N°: </p> <input type="text" name="Number" value ="<%out.print(currentFunc.getNumber());%>"/> 
              <p>Bairro: </p> <input type="text" name="District" value ="<%out.print(currentFunc.getDistrict());%>"/> 
              <p>Cidade: </p> <input type="text" name="City" value ="<%out.print(currentFunc.getCity());%>"/> 
              <p>Estado:</p>
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
              <p>Cargo: </p>
              <select name="Position" required disabled value ="<%out.print(currentFunc.getPosition());%>">
                <option value=""></option>
                <option value="Direção">Direção</option>
                <option value="Coordenção">Coordenação</option>
                <option value="Docente">Docente</option>
                <option value="Secretário">Secretário</option>
              </select>
              <p>Formação: </p> <input type="text" name="Graduation"  value ="<%out.print(currentFunc.getGraduation());%>"/>  
              <button id="buttonContainer">Salvar Dados</button>
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
          <div class = "buttonContainers">
            <a href="gerenciarFuncionarios.jsp"> <button> Voltar </button> </a>
            <a><button onclick="openModal()">Conceder Acesso</button></a>
          </div>
        </div>
    </div>




  </body>
</html>
