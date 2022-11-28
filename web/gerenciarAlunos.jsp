<%-- 
    Document   : gerenciarAlunos
    Created on : 23 de nov. de 2022, 00:38:43
    Author     : sfcma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Aluno"%>
<%@page import="DAO.AlunoDAO" %>
<%@page import="java.util.*"%>
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
        <link rel="stylesheet" href="./CSS/tableLayout.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Astralis | Gerenciar Alunos</title>
    </head>
    <body>
        <header>
          <div class="logoContainer">
            <a href="mainMenu.jsp"><img src="./Assets/Logo_Branco.png"></a>
          </div>
          <div class="menuContainer">
          <a href="mainMenu.jsp">Inicio</a>
          </div>
          <div class="welcomeContainer">
            
              <%out.print(" <p>Olá, " + user.getName() + "<br>");%>
              Você esta logado como:<br>
              <%out.print(user.getPosition() + "</p>");%>
          
              <img src="./Assets/profile.png">
            
          </div>
          <div class="logoutContainer">
            <a href="Authentication?action=Logout"><img src="./Assets/logout.png"></a>
          </div>
        </header>
        
        
        <%
        List<Aluno> allStudents = AlunoDAO.getAllStudents();
        %>
    <div class="mainContainer">
      <div class= "contentContainer">
        <h1>Gerenciar Alunos</h1>
        <div class="tableContainer">
        <table>
            <tr>
                <th id="center"> RM </th>
                <th id="left"> Nome </th>
                <th id="left"> Nome responsável </th>
                <th id="center"> Data de Nascimento </th>
                <th id="center"> Editar </th>
                <%-- <th> Excluir </th> --%>
                <th id="center"> Matricular </th>
            </tr>
            <% 
                for(int i = 0; i < allStudents.size(); i++){
            %>
            <tr id="trHover">
                <td id="center"><% out.print(allStudents.get(i).getRM());%></td>
                <td id="left"><% out.print(allStudents.get(i).getName());%></td>
                <td id="left"><% out.print(allStudents.get(i).getResponsavelMae());%></td>
                <td id="center"><% out.print(allStudents.get(i).getBirthDate());%></td>
                <td id="center"><a href="atualizarAluno.jsp?RM=<% out.print(allStudents.get(i).getRM());%>"> <img src ="./Assets/edit.png"> </a></td>
                <%-- <td><a href="Aluno?action=deletarAluno&RM=<% out.print(allStudents.get(i).getRM());%>"> <button> Excluir </button> </a> </td> --%>
                <td id="center"><a href="matricularAluno.jsp?RM=<% out.print(allStudents.get(i).getRM());%>"> <% if(allStudents.get(i).getIsMatriculado()){ out.print("<button disabled>"); } else { out.print("<button>");}; %> Matricular </button> </a> </td>
            </tr>
            <%}%>
        </table>
        </div>
        <div class = "buttonContainers">
            <a href="mainMenu.jsp"><button>Voltar</button></a>    
            <a href="novoAluno.jsp"> <button>Novo Aluno</button> </a>
        </div>
      </div>
    </div>

    </body>
</html>
