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
        <link rel="stylesheet" href="./CSS/cardLayout.css"/>
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
            List<Classe> assignedClass = ClasseDAO.getAllAssignedClassByFuncId(user);
        %>

        <div class="mainContainer">
            <div class="contentContainer">
                <div class="titleContainer">
                    <h1>Diario de Classe</h1>
                </div>
                <br>
                <div class=gridContainer>
                    <% 
                        for(int i = 0; i < assignedClass.size(); i++){
                    %>
                        <a href="salaDeAula.jsp?IdReg=<% out.print(assignedClass.get(i).getIdReg());%>">
                            <div class="cardContainer">
                                <h1><% out.print(assignedClass.get(i).getName());%></h1>
                                <br>
                                <p>ID de turma: <% out.print(assignedClass.get(i).getIdReg());%></p>
                                <p>Ano Letivo: <% out.print(assignedClass.get(i).getSchoolYear());%></p>         
                            </div>
                        </a>
                    <%}%>
                </div>
                <br>
                <div class="buttonContainers">
                    <a href="mainMenu.jsp"><button>Voltar</button></a>    
                </div>
            </div>
        </div>
    </body>
</html>
