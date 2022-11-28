
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.ClasseDAO" %>
<%@page import="model.Classe" %>
<%@page import="java.util.*" %>
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
        <title>Astralis | Atribuição de aula</title>
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
        List<Classe> list = ClasseDAO.getAllClasses();
    %>

    <div class="mainContainer">
        <div class="contentContainer">
            <h1>Atribuir Aula</h1>
            <div class="tableContainer">
            <h3>Selecione uma classe: </h3>
            <br>
                <table>
                    <tr>
                        <th id="center"> Id </th>
                        <th id="left"> Nome </th>
                        <th id="center"> Atribuir aula </th>
                    </tr>
                    <% 
                        for(int i = 0; i < list.size(); i++){
                    %>
                    <tr id="trHover">
                        <td id="center"><% out.print(list.get(i).getIdReg());%></td>
                        <td id="left"><% out.print(list.get(i).getName());%></td>
                        <td id="center"><a href="painelAtribuicao.jsp?IdReg=<% out.print(list.get(i).getIdReg());%>"><button> Atribuir Aulas </button></a></td>
                    </tr>
                    <%}%>
                </table>
            </div>
            <div class="buttonContainers"> 
                <a href="mainMenu.jsp"><button>Voltar</button></a>    
            </div>
        </div>
    </div>
    </body>
</html>
