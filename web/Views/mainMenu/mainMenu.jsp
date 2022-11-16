<%-- Document : mainMenu Created on : 15 de nov. de 2022, 16:22:08 Author :
sfcma --%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>JSP Page</title>
  </head>
  <body>
    <% String user = (String) session.getAttribute("user"); 
       if(user == null) {
          response.sendRedirect("../Login/loginScreen.html");
       } else { 
         out.print(" <h1>Welcome, " + user + "</h1>");
       } 
     %>

    <form action="../Login/logout.jsp">
      <input type="submit" value="Deslogar" />
    </form>

    <div>
      <a href="../employeeManagement/employeeManagement.jsp">
        Gerenciar Funcionários
      </a>
    </div>
  </body>
</html>
