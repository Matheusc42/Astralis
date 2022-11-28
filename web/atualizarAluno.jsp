<%@page import="DAO.AlunoDAO"%>
<%@page import="model.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%> 
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
    <link rel="stylesheet" href="./CSS/updateLayout.css"/>
    <script type="text/javascript" src="./Js/modal.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Astralis | Atualizar dados</title>
  </head>
  <%
      
      //Resgatando o Id do aluno atual
      int RM = Integer.parseInt(request.getParameter("RM"));

      //Criando objeto aluno de parametro de entrada com o Id atual
      Aluno alunoParam = new Aluno();
      alunoParam.setRM(RM);

      //Armazenando em um objeto funcionario os dados sobre o funcionario atual
      Aluno currentAluno = AlunoDAO.getOneStudentById(alunoParam);
  %>
  <body>

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

    <div class="mainContainer">
        <div class="contentContainer">
          <h1>Atualizar dados do aluno</h1>
          <form action="Aluno?action=atualizarAluno&RM=<%out.print(currentAluno.getRM());%>" method="post">
            
            <p>RM:</p> <input type="text" name="RM" value ="<%out.print(currentAluno.getRM());%>" readonly>
            <p>Nome:</p> <input type="text" name="Name" value ="<%out.print(currentAluno.getName());%>"/> 
            <p>RG:</p> <input type="text" name="RG" value ="<%out.print(currentAluno.getRG());%>"/> 
            <p>CPF:</p> <input type="text" name="CPF" value ="<%out.print(currentAluno.getCPF());%>"/> 
            <p>Certidão de Nascimento:</p> <input type="text" name="BirthCertificate" value ="<%out.print(currentAluno.getBirthCertificate());%>"/> 
            <p>Data de Nascimento:</p> <input type="date" name="BirthDate" value ="<%out.print(currentAluno.getBirthDate());%>"/> 
            <p>Nome da Mãe:</p> <input type="text" name="responsavelMae" value ="<%out.print(currentAluno.getResponsavelMae());%>"/> 
            <p>RG Mãe:</p> <input type="text" name="RGMae" value ="<%out.print(currentAluno.getRGMae());%>"/> 
            <p>CPF Mãe:</p> <input type="text" name="CPFMae" value ="<%out.print(currentAluno.getCPFMae());%>"/> 
            <p>Nome da Pai:</p> <input type="text" name="responsavelPai" value ="<%out.print(currentAluno.getResponsavelPai());%>"/> 
            <p>RG Pai:</p> <input type="text" name="RGMae" value ="<%out.print(currentAluno.getRGPai());%>"/> 
            <p>CPF Pai:</p> <input type="text" name="CPFMae" value ="<%out.print(currentAluno.getCPFPai());%>"/> 
            <p>Celular:</p> <input type="text" name="MobilePhone" value ="<%out.print(currentAluno.getMobilePhone());%>"/>
            <p>Telefone:</p> <input type="text" name="Phone" value ="<%out.print(currentAluno.getPhone());%>"/> 
            <p>Email:</p> <input type="text" name="Mail" value ="<%out.print(currentAluno.getMail());%>"/> 
            <p>CEP:</p> <input type="text" name="CEP" value ="<%out.print(currentAluno.getCEP());%>"/> 
            <p>Endereço:</p> <input type="text" name="Address" value ="<%out.print(currentAluno.getAddress());%>"/> 
            <p>N°:</p> <input type="text" name="Number" value ="<%out.print(currentAluno.getNumber());%>"/> 
            <p>Bairro:</p> <input type="text" name="District" value ="<%out.print(currentAluno.getDistrict());%>"/> 
            <p>Cidade:</p> <input type="text" name="City" value ="<%out.print(currentAluno.getCity());%>"/> 
            
            <p>Estado:</p>
            <select id="estado" name="UF">
              <option value="" disabled selected> <%out.print(currentAluno.getUF());%> </option>
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
            <button id="buttonContainer">Atualizar</button>
          </form>
        <div class="buttonContainers">
          <a href="gerenciarAlunos.jsp"> <button> Voltar </button> </a>
        </div>
        </div>
    </div>

  

  </body>
</html>
