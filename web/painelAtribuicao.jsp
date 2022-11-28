
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.ClasseDAO" %>
<%@page import="model.Classe" %>
<%@page import="java.util.*" %>
<%@page import="DAO.FuncionarioDAO" %>
<%@page import="model.Funcionario" %>
<%@page import="DAO.AssigmentDAO" %>

<% 
       Funcionario user = (Funcionario) request.getSession().getAttribute("user");
       if(user == null) {
          response.sendRedirect("loginScreen.jsp");
       }
     %>

        <%
            //Resgatando parametros da URL
            int IdReg = Integer.parseInt(request.getParameter("IdReg"));

            //Criando obj Classe Parametro
            Classe classeParam = new Classe();
            classeParam.setIdReg(IdReg);

            //Criando obj Classe atual
            Classe currentClasse = ClasseDAO.getOneClasseById(classeParam);
        %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="./CSS/tableLayout.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%out.print(currentClasse.getName());%> | Atribuição de aula</title>
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
            List<Funcionario> assignedFunc = AssigmentDAO.getAssignedDocente(classeParam);
            List<Funcionario> availableFunc = FuncionarioDAO.getAllDocente();
        %>

        <div class="mainContainer">
            <div class="contentContainer">
                <h1><%out.print(currentClasse.getName());%></h1>    
                <div class="tableContainer">
                    <h3> Professores associados a essa turma: </h3>
                    <table>
                        <tr> 
                            <th id="left"> Nome </th>
                            <th id="left"> Formação </th>
                        </tr>
                        <%
                            for(int i = 0; i < assignedFunc.size(); i++){
                        %>
                        <tr id="trHover">
                            <td id="left"><%out.print(assignedFunc.get(i).getName());%></td>
                            <td id="left"><%out.print(assignedFunc.get(i).getGraduation());%></td>
                        </tr>    
                    <%}%> 
                    </table>
                </div>
                <div class="tableContainer">
                    <h3> Professores para atribuição: </h3>
                    <table>
                        <tr>
                            
                            <th id="left"> Nome </th>
                            <th id="left"> Formação </th>
                            <th id="center"> Atribuição </th> 
                        </tr>
                        <%
                            for(int i = 0; i < availableFunc.size(); i++){
                        %>
                        <tr id="trHover">
                            <td id="left"><%out.print(availableFunc.get(i).getName());%></td>
                            <td id="left"><%out.print(availableFunc.get(i).getGraduation());%></td>
                            <td id="center"><a href="Assigment?action=novaAtr&idFunc=<%out.print(availableFunc.get(i).getIdReg());%>&idClasse=<%out.print(currentClasse.getIdReg());%>"><button>Atribuição</button></a></td>
                        </tr>    
                        <%}%>  
                    </table>
                </div>
                <div class="buttonContainers">
                    <a href="gerenciarAtribuicao.jsp"><button>Voltar</button></a>
                </div>
            </div>
        </div>
    </body>
</html>
