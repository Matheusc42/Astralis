<%-- 
    Document   : detalhesClasse
    Created on : 23 de nov. de 2022, 16:10:05
    Author     : sfcma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Classe"%>
<%@page import="DAO.ClasseDAO" %>
<%@page import="DAO.AlunoDAO"%>
<%@page import="model.Aluno"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
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
        <a href="gerenciarClasses.jsp"><button> Voltar </button></a>
        <h1><% out.print(returnClasse.getName());%></h1>
        <br><br>
        <table border="1px">
            <tr>
                <th> RM </th>
                <th> Nome </th>
                <th> Data Nasc. </th>
                <th> RG </th>
                <th> Remover Matricula </th>
            </tr>
            <% 
                for(int i = 0; i < classStudents.size(); i++){
            %>
            <tr>
                <td><% out.print(classStudents.get(i).getRM());%></td>
                <td><% out.print(classStudents.get(i).getName());%></td>
                <td><% out.print(classStudents.get(i).getBirthDate());%></td>
                <td><% out.print(classStudents.get(i).getRG());%></td>
                <td><a href="confirmDeleteMatricula.jsp?RM=<% out.print(classStudents.get(i).getRM());%>&IdClasse=<% out.print(IdReg);%>"><button>Remove</button></a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
