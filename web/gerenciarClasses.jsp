<%-- 
    Document   : gerenciarClasse
    Created on : 22 de nov. de 2022, 23:23:48
    Author     : sfcma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Classe"%>
<%@page import="DAO.ClasseDAO" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Astralis | Gerenciar Classe</title>
    </head>
    <body>
        <a href="mainMenu.jsp"><button>Voltar</button></a>    
        <h1>Gerenciar Classes</h1>
        <a href="novaClasse.jsp"> <button>Nova Classe</button> </a>
    <br><br><br>

    <%
        List<Classe> allClasses = ClasseDAO.getAllClasses();
    %>

    <table border="1px">
            <tr>
                <th> Id </th>
                <th> Nome </th>
                <th> Ano Letivo </th>
                <th> Editar </th>
                <th> Excluir </th>
                <th> Gerenciar </th>
            </tr>
            <% 
                for(int i = 0; i < allClasses.size(); i++){
            %>
            <tr>
                <td><% out.print(allClasses.get(i).getIdReg());%></td>
                <td><% out.print(allClasses.get(i).getName());%></td>
                <td><% out.print(allClasses.get(i).getSchoolYear());%></td>
                <td><a href="atualizarClasse.jsp?IdReg=<% out.print(allClasses.get(i).getIdReg());%>"> <button> Editar </button> </a></td>
                <td><a href="Classe?action=deletarClasse&IdReg=<% out.print(allClasses.get(i).getIdReg());%>"> <button> Excluir </button> </a> </td>
                <td><a href="detalhesClasse.jsp?IdReg=<% out.print(allClasses.get(i).getIdReg());%>"> <button> Gerenciar </button> </a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
