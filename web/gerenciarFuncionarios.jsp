<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%> 
<%@page import="DAO.FuncionarioDAO"%> 
<%@page import="model.Funcionario"%>
<%@page import="java.util.*"%>

<% 
       Funcionario user = (Funcionario) request.getSession().getAttribute("user");
       if(user == null) {
          response.sendRedirect("loginScreen.jsp");
       }
     %>

<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="./CSS/tableLayout.css">
    <script type="text/javascript" src="./Js/modal.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Astralis | Gerenciar Funcionarios</title>
  </head>
  <body>
  <header>
      <div class="logoContainer">
        <a href="mainMenu.jsp"><img src="./Assets/Logo_Branco.png"></a>
      </div>
      <div class="menuContainer">
       <a href="mainMenu.jsp">Inicio</a>
      </div>
      <div class="welcomeContainer">
        
          <%out.print(" <p>Olá, " + user.getName() + "<br>");%>
          Você esta logado como:<br>
          <%out.print(user.getPosition() + "</p>");%>
      
          <img src="./Assets/profile.png">
        
       </div>
      <div class="logoutContainer">
        <a href="Authentication?action=Logout"><img src="./Assets/logout.png"></a>
      </div>
    </header>

    <%
      List<Funcionario> list = FuncionarioDAO.getAllEmployee();
    %>

    <div class="mainContainer">
      <div class= "contentContainer">
        <h1>Gerenciar Funcionários</h1>
        <div class="tableContainer">
          <table>
            <tr>
                <th id ="left"> <b>Nome</b> </th>
                <th id="center"> <b>Cargo</b> </th>
                <th id="center"> <b>Editar</b> </th>
                <th id="center"> <b>Excluir</b> </th>
                <th id="center"> <b>Acesso</b> </th>
            </tr>
            <% 
              for(int i = 0; i < list.size(); i++){
            %>
            <tr id="trHover">
                <td id ="left"> 
                    <% out.print(list.get(i).getName());%>
                </td>
                <td id="center"> 
                    <% out.print(list.get(i).getPosition());%>
                </td>
                <td id="center">
                    <a href="atualizarFuncionario.jsp?IdReg=<%out.print(list.get(i).getIdReg());%>"><img src="Assets/edit.png" width="24px" height="24px"></a>
                </td>
                <td id="center">
                  <a href="Funcionario?action=deletarFuncionario&IdReg=<%out.print(list.get(i).getIdReg());%>"> <img src="Assets/delete.png" width="24px" height="24px"> </a>
                </td >
                <td id="center">
                  <a href="confirmDeleteAccessFunc.jsp?IdReg=<%out.print(list.get(i).getIdReg());%>"><button class="buttons"> Gerenciar </button> </a>
                </td>
            </tr>
            <%}%>
          </table> 
        </div>
        <div class="buttonContainers">
            <a href="mainMenu.jsp"><button class="buttons">Voltar</button></a>    
            <a href="novoFuncionario.jsp"> <button class="buttons">Novo Funcionário</button> </a>   
        </div>
      </div>
    </div>
  </body>
</html>
