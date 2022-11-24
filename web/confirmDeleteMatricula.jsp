
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Astralis | Confirmar Ação</title>
    </head>
    <%
        String IdClasse = request.getParameter("IdClasse");
        String RM = request.getParameter("RM");
    %>
    <body>
        <h1>Atenção</h1>
        <p>A Ação a seguir ira desvincular o aluno da turma</p>
        <a href="Aluno?action=excluirMatricula&RM=<%out.print(RM);%>&IdClasse=<%out.print(IdClasse);%>"><button> Confirmar </button> </a>
        <a href="detalhesClasse.jsp?IdReg=<%out.print(IdClasse);%>"><button> Cancelar </button> </a>
    </body>
</html>
