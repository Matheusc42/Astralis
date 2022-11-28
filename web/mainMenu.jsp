<%-- Document : mainMenu Created on : 15 de nov. de 2022, 16:22:08 Author :
sfcma --%> 
<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./CSS/MainMenu/mainMenu.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Astralis</title>
  </head>
  <body>
    <% 
       Funcionario user = (Funcionario) request.getSession().getAttribute("user");
       if(user == null) {
          response.sendRedirect("loginScreen.jsp");
       } else{%>
         
      

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
    <%
     } 
     %>


    <div class = "mainContainer">
      <div class = "gridContainer">
        <div class = "serviceCard">
          <img src="./Assets/funcionario.png">
          <a href="gerenciarFuncionarios.jsp">
            <h2>Gerenciar Funcionários</h2>
            <br>
            <p>Cadastre novos funcionários, consulte seus dados e gerencie seus acessos </p>
          </a>
        </div>
        <div class = "serviceCard">
          <img src="./Assets/aluno.png">
          <a href="gerenciarAlunos.jsp">
            <h2>Gerenciar Alunos</h2>
            <br>
            <p>Cadastre novos alunos, consulte seus dados e gerencie a matricule seus alunos</p>
          </a>
        </div>
        <div class = "serviceCard">
          <img src="./Assets/classe.png">
          <a href="gerenciarClasses.jsp">
            <h2>Gerenciar Classes</h2>
            <br>
            <p>Crie suas classes e as gerencie, consulte notas e faltas dos estudantes matriculados e gerencie os alunos matriculados</p>
          </a>
        </div>
        <div class = "serviceCard">
          <img src="./Assets/assigment.png">
          <a href="gerenciarAtribuicao.jsp">
            <h2>Atribuição de aula</h2>
            <br>
            <p>Gerencia a atribuição de aulas dos seus professores. Delegue turmas e disciplinas</p>
          </a>
        </div>
        <%
        if(user.getPosition().equals("Docente")){
      %>
        <div class = "serviceCard">
          <img src="./Assets/diario.png">
          <a href="diarioDeClasse.jsp">
            <h2>Diario de Classe</h2>
            <br>
            <p>Gerencie a sua sala de aula. Inclua notas e Faltas, e tenha visualização completa das turmas que estão atribuídas a você</p>
          </a>
        </div>
      <%}%>
      </div>
    </div>    
      

      
      
      
      
  </body>
</html>
