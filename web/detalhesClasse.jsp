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
     %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="./CSS/tableLayout.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Astralis | Detalhes da classe </title>
    </head>
    <%
        
        //Recuperando parametro de classe
        int IdReg = Integer.parseInt(request.getParameter("IdReg"));

     
        //Criando objeto paramettro classe
        Classe classeParam = new Classe();
        classeParam.setIdReg(IdReg  );

        //Recuperando a classe
        Classe returnClasse = ClasseDAO.getOneClasseById(classeParam);

        //Criando lista de alunos
        List<Aluno> classStudents = AlunoDAO.getAllStudentsInAClass(classeParam);

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

        <div class="mainContainer">
            <div class="contentContainer">
                <h1><% out.print(returnClasse.getName());%></h1>
                <div class="tableContainer">
                    <table >
                        <tr>
                            <th id="center"> RM </th>
                            <th id="left"> Nome </th>
                            <th id="center"> Data Nasc. </th>
                            <th id="left"> RG </th>
                            <th id="center"> Remover Matricula </th>
                            <th id="center"> Boletim </th>
                        </tr>
                        <% 
                            for(int i = 0; i < classStudents.size(); i++){
                        %>
                        <tr id="trHover">
                            <td id="center"><% out.print(classStudents.get(i).getRM());%></td>
                            <td id="left"><% out.print(classStudents.get(i).getName());%></td>
                            <td id="center"><% out.print(classStudents.get(i).getBirthDate());%></td>
                            <td id="left"><% out.print(classStudents.get(i).getRG());%></td>
                            <td id="center"><a href="confirmDeleteMatricula.jsp?RM=<% out.print(classStudents.get(i).getRM());%>&IdClasse=<% out.print(IdReg);%>"><button>Remover</button></a></td>
                            <td id="center"><a href="painelNotasGerais.jsp?RM=<% out.print(classStudents.get(i).getRM());%>&IdClasse=<% out.print(IdReg);%>"><button> Notas </button></a></td>
                        </tr>
                        <%}%>
                    </table>
                </div>
                <div class="buttonContainers">
                    <a href="gerenciarClasses.jsp"><button> Voltar </button></a>
                </div>
            </div>
        </div>
    </body>
</html>
