<%-- 
    Document   : atualizarClasse
    Created on : 22 de nov. de 2022, 23:56:34
    Author     : sfcma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Classe"%>
<%@page import="DAO.ClasseDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Astralis | Atualizar Classe</title>
    </head>
    <%
        //Recuperando parametros
        int IdReg = Integer.parseInt(request.getParameter("IdReg"));

        //Criando Classe parametro
        Classe classeParam = new Classe();
        classeParam.setIdReg(IdReg);

        //Chamando classe atual
        Classe currentClasse = ClasseDAO.getOneClasseById(classeParam);
    %>
    <body>
       <a href="gerenciarClasses.jsp"><button>Voltar</button></a>    
        <h1>Nova Classe</h1>

        <form action="Classe?action=atualizarClasse" method="post">
            <input type="text" name="IdReg" readonly value="<%out.print(currentClasse.getIdReg());%>" hidden />
            Nome: <input type="text" name="name"value="<%out.print(currentClasse.getName());%>" /><br>
            Ano Letivo: <input type="text" name="schoolYear" value="<%out.print(currentClasse.getSchoolYear());%>" /><br>
            <input type="submit" value="Atualizar Dados" />
        </form>
    </body>
</html>
