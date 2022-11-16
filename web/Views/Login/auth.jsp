<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@page import="controller.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>

<%
    String user = request.getParameter("user");
    String pwd = request.getParameter("pwd");

    if(user != null && pwd != null && !user.isEmpty() && !pwd.isEmpty()){

        User userAuth = UserDAO.getAuthentication(user, pwd);
        String userName = userAuth.getUser();

        if(userName != null){

            session.setAttribute("user", userAuth.getUser());
            response.sendRedirect("../mainMenu/mainMenu.jsp");
            
        } else {
            out.print("Senha ou Usuarios errados");
        }
        


    }

%>
