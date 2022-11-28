
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Classe"%>
<%@page import="DAO.ClasseDAO" %>
<%@page import="DAO.AlunoDAO"%>
<%@page import="model.Aluno"%>
<%@page import="java.util.*"%>
<%@page import="model.Funcionario"%>
<% 
       Funcionario user = (Funcionario) request.getSession().getAttribute("user");
       if(user == null) {
          response.sendRedirect("loginScreen.jsp");
       }
        
        //Recuperando parametro de classe
        int IdReg = Integer.parseInt(request.getParameter("IdReg"));

        //Criando objeto paramettro classe
        Classe classeParam = new Classe();
        classeParam.setIdReg(IdReg);

        //Recuperando a classe
        Classe returnClasse = ClasseDAO.getOneClasseById(classeParam);

        //Criando lista de alunos
        List<Aluno> classStudents = AlunoDAO.getAllStudentsInAClass(classeParam);

    %>
<!DOCTYPE html>
<html>
    <head>        
        <link rel="stylesheet" href="./CSS/tableLayout.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><% out.print(returnClasse.getName());%> | Diario de Classe </title>
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

        <div class="mainContainer">
            <div class="contentContainer">
                <h1>Diario de classe</h1>
                <div class="tableContainer">
                    <table >
                        <tr>
                            <th id="center"> RM </th>
                            <th id="left"> Nome </th>
                            <th id="center"> Data Nasc. </th>
                            <th id="center"> Notas </th>
                        </tr>
                        <% 
                            for(int i = 0; i < classStudents.size(); i++){
                        %>
                        <tr id="trHover">
                            <td id="center"><% out.print(classStudents.get(i).getRM());%></td>
                            <td id="left"><% out.print(classStudents.get(i).getName());%></td>
                            <td id="center"><% out.print(classStudents.get(i).getBirthDate());%></td>
                            <td id="center"><a href="painelNotas.jsp?RM=<% out.print(classStudents.get(i).getRM());%>&idClass=<%out.print(IdReg);%>"><button>Notas</button></a></td>
                        </tr>
                        <%}%>
                    </table>
                </div>
                <div class="buttonContainers">
                    <a href="diarioDeClasse.jsp"><button> Voltar </button></a>
                </div>
            </div>
        </div>
    </body>
</html>
