<%-- 
    Document   : confirmDeleteFunc
    Created on : 21 de nov. de 2022, 18:29:36
    Author     : sfcma
--%>

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
        <link rel="stylesheet" href="./CSS/confirmLayout.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Astralis | Confirmar Ação</title>
    </head>
    <%
        String IdReg = request.getParameter("IdReg");
    %>
    <body>
        <div class = "mainContainer">
            <div class = "contentContainer">
                <h1>Atenção</h1>
                <p>A ação a seguir ira remover o acesso do usuario<br>Tem certeza que deseja continuar?</p>
                <div class ="buttonContainers">
                    <a href="Funcionario?action=excluirAcesso&IdReg=<%out.print(IdReg);%>"><button> Confirmar </button> </a>
                    <a href="gerenciarFuncionarios.jsp"><button> Cancelar </button> </a>
                </div>
            </div>
        </div>
    </body>
</html>
