<%-- Document : mainMenu Created on : 15 de nov. de 2022, 16:22:08 Author :
sfcma --%> 
<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Astralis</title>
  </head>
  <body>
    <% 
       Funcionario user = (Funcionario) request.getSession().getAttribute("user");
       if(user == null) {
          response.sendRedirect("loginScreen.jsp");
       } else { 
         out.print(" <h1>Welcome, " + user.getUser() + "</h1>");
       } 
     %>

    <a href="Authentication?action=Logout"><button>Deslogar</button></a>

    <div>
      <a href="gerenciarFuncionarios.jsp">
        Gerenciar Funcionários
      </a>
      <br>
      <a href="">
        Gerenciar Alunos 
      </a>
      <br>
      <a href="gerenciarClasses.jsp">
        Gerenciar Classes
      </a>
      <br>
      <a href="gerenciarAtribuicao.jsp">
        Atribuição de aula
      </a>
    </div>
  </body>
</html>
