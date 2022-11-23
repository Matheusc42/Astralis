<%-- 
    Document   : gerenciarAlunos
    Created on : 23 de nov. de 2022, 00:38:43
    Author     : sfcma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Aluno"%>
<%@page import="DAO.AlunoDAO" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Astralis | Gerenciar Alunos</title>
    </head>
    <body>
        <a href="mainMenu.jsp"><button>Voltar</button></a>    
        <h1>Gerenciar Alunos</h1>
        <a href="novoAluno.jsp"> <button>Novo Aluno</button> </a>
        <br><br><br>

        <%
        List<Aluno> allStudents = AlunoDAO.getAllStudents();
        %>

    <table border="1px">
            <tr>
                <th> RM </th>
                <th> Nome </th>
                <th> Nome responsável </th>
                <th> Data de Nascimento </th>
                <th> Editar </th>
                <th> Excluir </th>
                <th> Matricular </th>
            </tr>
            <% 
                for(int i = 0; i < allStudents.size(); i++){
            %>
            <tr>
                <td><% out.print(allStudents.get(i).getRM());%></td>
                <td><% out.print(allStudents.get(i).getName());%></td>
                <td><% out.print(allStudents.get(i).getResponsavelMae());%></td>
                <td><% out.print(allStudents.get(i).getBirthDate());%></td>
                <td><a href="atualizarClasse.jsp?IdReg=<% out.print(allStudents.get(i).getRM());%>"> <button> Editar </button> </a></td>
                <td><a href="Aluno?action=deletarClasse&IdReg=<% out.print(allStudents.get(i).getRM());%>"> <button> Excluir </button> </a> </td>
                <td><button> Matricular </button> </td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
