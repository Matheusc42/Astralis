<%-- 
    Document   : atualizarClasse
    Created on : 22 de nov. de 2022, 23:56:34
    Author     : sfcma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Classe"%>
<%@page import="DAO.ClasseDAO" %>
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
        <link rel="stylesheet" href="./CSS/Classe/classeLayout.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Astralis | Atualizar Classe</title>
    </head>
    <%
        //Recuperando parametros
        int IdReg = Integer.parseInt(request.getParameter("IdReg"));

        //Criando Classe parametro
        Classe classeParam = new Classe();
        classeParam.setIdReg(IdReg);

        //Chamando classe atual
        Classe currentClasse = ClasseDAO.getOneClasseById(classeParam);
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
        <%out.print(" <p>Olá, " + user.getName() + "<br>");%>
        Você esta logado como:<br>
        <%out.print(user.getPosition() + "</p>");%>
        <img src="./Assets/profile.png">
      </div>
      <div class="logoutContainer">
        <a href="Authentication?action=Logout"><img src="./Assets/logout.png"></a>
      </div>
    </header>

    <div class = "mainContainer">
        <div class = "contentContainer">
            <h1>Nova Classe</h1>
            <form action="Classe?action=atualizarClasse" method="post">
                <input type="text" name="IdReg" readonly value="<%out.print(currentClasse.getIdReg());%>" hidden />
                <p>Nome:</p> <input type="text" name="name"value="<%out.print(currentClasse.getName());%>" /><br>
                <p>Ano Letivo:</p> <input type="text" name="schoolYear" value="<%out.print(currentClasse.getSchoolYear());%>" /><br>
                <button> Atualizar Dados </button>
            </form>
            <div class = "buttonContainers">
                <a href="gerenciarClasses.jsp"><button>Voltar</button></a>    
            </div>
        </div>
    </div>

    </body>
</html>
