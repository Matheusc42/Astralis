<%-- 
    Document   : novaClasse
    Created on : 22 de nov. de 2022, 23:36:02
    Author     : sfcma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Astralis | Nova Classe</title>
    </head>
    <body>
       <a href="gerenciarClasses.jsp"><button>Voltar</button></a>    
        <h1>Nova Classe</h1>

        <form action="Classe?action=novaClasse" method="post">
            Nome: <input type="text" name="name"/><br>
            Ano Letivo: <input type="text" name="schoolYear"/><br>
            <input type="submit" value="Cadastrar" />
        </form>
    </body>
</html>
