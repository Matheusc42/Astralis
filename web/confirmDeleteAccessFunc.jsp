<%-- 
    Document   : confirmDeleteFunc
    Created on : 21 de nov. de 2022, 18:29:36
    Author     : sfcma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Astralis | Confirmar Ação</title>
    </head>
    <%
        String IdReg = request.getParameter("IdReg");
    %>
    <body>
        <h1>Atenção</h1>
        <p>A Ação a seguir ira remover o acesso do usuario</p>
        <a href="Funcionario?action=excluirAcesso&IdReg=<%out.print(IdReg);%>"><button> Confirmar </button> </a>
        <a href="gerenciarFuncionarios.jsp"><button> Cancelar </button> </a>
    </body>
</html>
