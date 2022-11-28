<%-- 
    Document   : gerenciarClasse
    Created on : 22 de nov. de 2022, 23:23:48
    Author     : sfcma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Classe"%>
<%@page import="DAO.ClasseDAO" %>
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
        <title>Astralis | Gerenciar Classe</title>
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
        List<Classe> allClasses = ClasseDAO.getAllClasses();
    %>

    <div class="mainContainer">
        <div class="contentContainer">
            <h1>Gerenciar Classes</h1>
            <div class="tableContainer">
    <table>
            <tr>
                <th id="center"> Id </th>
                <th id="left"> Nome </th>
                <th id="center"> Ano Letivo </th>
                <th id="center"> Editar </th>
                <th id="center"> Excluir </th>
                <th id="center"> Gerenciar </th>
            </tr>
            <% 
                for(int i = 0; i < allClasses.size(); i++){
            %>
            <tr id="trHover">
                <td id="center"><% out.print(allClasses.get(i).getIdReg());%></td>
                <td id="left"><% out.print(allClasses.get(i).getName());%></td>
                <td id="center"><% out.print(allClasses.get(i).getSchoolYear());%></td>
                <td id="center"><a href="atualizarClasse.jsp?IdReg=<% out.print(allClasses.get(i).getIdReg());%>"> <img src="./Assets/edit.png"> </a></td>
                <td id="center"><a href="Classe?action=deletarClasse&IdReg=<% out.print(allClasses.get(i).getIdReg());%>"> <img src="./Assets/delete.png"> </a> </td>
                <td id="center"><a href="detalhesClasse.jsp?IdReg=<% out.print(allClasses.get(i).getIdReg());%>"> <button> Gerenciar </button> </a></td>
            </tr>
            <%}%>
        </table>
            </div>
            <div class="buttonContainers">
                <a href="mainMenu.jsp"><button>Voltar</button></a>    
                <a href="novaClasse.jsp"> <button>Nova Classe</button> </a>
            </div>
        </div>
    </div>
    </body>
</html>
