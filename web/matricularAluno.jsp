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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Astralis | Matricular aluno </title>
    </head>
    <body>
        <a href="gerenciarAlunos.jsp"><button>Voltar</button></a>   
        <h1> Matricular Aluno </h1>
        
        <%
        String RM = request.getParameter("RM");
        List<Classe> allClasses = ClasseDAO.getAllClasses();
    %>

    <table border="1px">
            <tr>
                <th> Nome </th>
                <th> Matricular </th>
            </tr>
            <% 
                for(int i = 0; i < allClasses.size(); i++){
            %>
            <tr>
                <td><% out.print(allClasses.get(i).getName());%></td>
                <td><a href="Aluno?action=matricularAluno&RM=<% out.print(RM);%>&IdClasse=<% out.print(allClasses.get(i).getIdReg());%>"> <button> Matricular Aluno</button> </a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
