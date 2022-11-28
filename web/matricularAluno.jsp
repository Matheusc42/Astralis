<%@page import="java.util.*"%>
<%@page import="model.Classe"%>
<%@page import="DAO.ClasseDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title> Astralis | Matricular aluno </title>
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
            String RM = request.getParameter("RM");
            List<Classe> allClasses = ClasseDAO.getAllClasses();
        %>

        <div class= "mainContainer">
            <div class="contentContainer">
                <h1> Matricular Aluno </h1>
                <div class= "tableContainer">
                    <table>
                        <tr>
                            <th id="left"> Nome </th>
                            <th id="center"> Matricular </th>
                        </tr>
                        <% 
                            for(int i = 0; i < allClasses.size(); i++){
                        %>
                        <tr id="trHover">
                            <td id="left"><% out.print(allClasses.get(i).getName());%></td>
                            <td id="center"><a href="Aluno?action=matricularAluno&RM=<% out.print(RM);%>&IdClasse=<% out.print(allClasses.get(i).getIdReg());%>"> <button> Matricular Aluno</button> </a></td>
                        </tr>
                        <%}%>
                    </table>
                </div>
                <div class = "buttonContainers">
                    <a href="gerenciarAlunos.jsp"><button>Voltar</button></a>   
                </div>
            </div>
        </div>

        

    </body>
</html>
