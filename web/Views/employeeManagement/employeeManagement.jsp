<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%> 
<%@page import="controller.FuncionarioDAO"%> 
<%@page import="model.Funcionario"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Gerenciamento de Funcionários</title>
  </head>
  <body>
    <%
      List<Funcionario> list = FuncionarioDAO.getAllEmployee();

    %>
    <a href="../mainMenu/mainMenu.jsp"><button>Voltar</button></a>    
    <h1>Gerenciar Funcionários</h1>
    <a href="./newEmployeeForm.jsp"> <button>Novo Funcionário</button> </a>
    <br><br><br>
    <table border="1px">
      <tr>
          <th> ID </th>
          <th> Nome </th>
          <th> Cargo </th>
          <th> Editar </th>
          <th> Excluir </th>
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
              <img src="../../Assets/edit.png" width="24px" height="24px">
            </td>
            <td>
              <img src="../../Assets/delete.png" width="24px" height="24px">
            </td>
        </tr>
        <%}%>
    </table>    
  </body>
</html>
