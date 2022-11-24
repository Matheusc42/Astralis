
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.ClasseDAO" %>
<%@page import="model.Classe" %>
<%@page import="java.util.*" %>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Astralis | Atribuição de aula</title>
    </head>
    <body>
    <%
        List<Classe> list = ClasseDAO.getAllClasses();
    %>
        <a href="mainMenu.jsp"><button>Voltar</button></a>    
        <h1>Atribuir Aula</h1>
        <h3>Selecione uma classe: </h3>

        <table border="1px">
            <tr>
                <th> Id </th>
                <th> Nome </th>
                <th> Atribuir aula </th>
            </tr>
            <% 
                for(int i = 0; i < list.size(); i++){
            %>
            <tr>
                <td><% out.print(list.get(i).getIdReg());%></td>
                <td><% out.print(list.get(i).getName());%></td>
                <td><a href="painelAtribuicao.jsp?IdReg=<% out.print(list.get(i).getIdReg());%>"><button> Atribuir Aulas </button></a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
