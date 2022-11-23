<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%> 
<%@page import="DAO.FuncionarioDAO"%> 
<%@page import="model.Funcionario"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="./CSS/modal.css">
    <script type="text/javascript" src="./Js/modal.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Astralis | Gerenciar Funcionarios</title>
  </head>
  <body>

    <%
      List<Funcionario> list = FuncionarioDAO.getAllEmployee();
    %>

    <a href="mainMenu.jsp"><button>Voltar</button></a>    
    <h1>Gerenciar Funcionários</h1>
    <a href="novoFuncionario.jsp"> <button>Novo Funcionário</button> </a>
    <br><br><br>
    <table border="1px">
      <tr>
          <th> ID </th>
          <th> Nome </th>
          <th> Cargo </th>
          <th> Editar </th>
          <th> Excluir </th>
          <th> Acesso </th>
      </tr> 
        <% 
            for(int i = 0; i < list.size(); i++){
        %>
        <tr>
            <td>
                <% out.print(list.get(i).getIdReg());%>
            </td>
            <td> 
                <% out.print(list.get(i).getName());%>
            </td>
            <td> 
                <% out.print(list.get(i).getPosition());%>
            </td>
            <td>
                <a href="atualizarFuncionario.jsp?IdReg=<%out.print(list.get(i).getIdReg());%>"><img src="Assets/edit.png" width="24px" height="24px"></a>
            </td>
            <td>
              <a href="Funcionario?action=deletarFuncionario&IdReg=<%out.print(list.get(i).getIdReg());%>"> <img src="Assets/delete.png" width="24px" height="24px"> </a>
            </td>
            <td>
              <a href="confirmDeleteAccessFunc.jsp?IdReg=<%out.print(list.get(i).getIdReg());%>"><button> Gerenciar </button> </a>
            </td>
        </tr>
        <%}%>
    </table>    
  </body>
</html>
