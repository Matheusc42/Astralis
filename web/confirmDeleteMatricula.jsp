
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
        String IdClasse = request.getParameter("IdClasse");
        String RM = request.getParameter("RM");
    %>
    <body>
        <div class="mainContainer">
            <div class="contentContainer">
                <h1>Atenção</h1>
                <p>A Ação a seguir ira desvincular o aluno da turma <br> Tem certeza que deseja continuar?</p>
                <div class="buttonContainers">
                    <a href="Aluno?action=excluirMatricula&RM=<%out.print(RM);%>&IdClasse=<%out.print(IdClasse);%>"><button> Confirmar </button> </a>
                    <a href="detalhesClasse.jsp?IdReg=<%out.print(IdClasse);%>"><button> Cancelar </button> </a>
                </div>
            </div>
        </div>
    </body>
</html>
