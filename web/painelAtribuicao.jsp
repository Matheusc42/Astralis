<%-- 
    Document   : painelAtribuicao
    Created on : 21 de nov. de 2022, 22:50:59
    Author     : sfcma
--%>

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%out.print(currentClasse.getName());%> | Atribuição de aula</title>
    </head>
    <body>
        <a href="gerenciarAtribuicao.jsp"><button>Voltar</button></a>
        <h1><%out.print(currentClasse.getName());%></h1>
        <h3> Professores associados a essa turma: </h3>
        
        <%
            List<Funcionario> assignedFunc = AssigmentDAO.getAssignedDocente(classeParam);
        %>

        <table border="1px">
            <tr> 
                <th> Nome </th>
                <th> Formação </th>
            </tr>
            <%
                for(int i = 0; i < assignedFunc.size(); i++){
            %>
            <tr>
                <td><%out.print(assignedFunc.get(i).getName());%></td>
                <td><%out.print(assignedFunc.get(i).getGraduation());%></td>
            </tr>    
        <%}%> 
        </table>



        <%
            List<Funcionario> availableFunc = FuncionarioDAO.getAllDocente();
        %>
        <h3> Professores para atribuição: </h3>

        <table border="1px">
            <tr>
                <th> Id </th>
                <th> Nome </th>
                <th> Formação </th>
                <th> Atribuição </th> 
            </tr>
            <%
                for(int i = 0; i < availableFunc.size(); i++){
            %>
            <tr>
                <td><%out.print(availableFunc.get(i).getIdReg());%></td>
                <td><%out.print(availableFunc.get(i).getName());%></td>
                <td><%out.print(availableFunc.get(i).getGraduation());%></td>
                <td><a href="Assigment?action=novaAtr&idFunc=<%out.print(availableFunc.get(i).getIdReg());%>&idClasse=<%out.print(currentClasse.getIdReg());%>"><button>Atribuição</button></a></td>
            </tr>    
            <%}%>  
        </table>

    </body>
</html>
