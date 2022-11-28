
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Funcionario"%>
<%@page import="model.Boletim" %>
<%@page import="model.Aluno" %>
<%@page import="DAO.BoletimDAO" %>
<%@page import="DAO.FuncionarioDAO" %>
<%@page import="java.util.*" %>

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Astralis | Notas do Aluno</title>
    </head>
    <%
        String idClass = request.getParameter("IdClasse");
        int RM = Integer.parseInt(request.getParameter("RM"));

        Aluno alunoParam = new Aluno();
        alunoParam.setRM(RM);

        List<Boletim> listReportingSchool = BoletimDAO.getAllStudentSchoolReport(alunoParam);
    %>
    <body>

        <header>
          <div class="logoContainer">
            <a href="mainMenu.jsp"><img src="./Assets/Logo_Branco.png"></a>
          </div>
          <div class="menuContainer">
          <a href="mainMenu.jsp">Inicio</a>
          </div>
          <div class="welcomeContainer">
            
              <%out.print(" <p>Olá, " + user.getUser() + "<br>");%>
              Você esta logado como:<br>
              <%out.print(user.getPosition() + "</p>");%>
          
              <img src="./Assets/profile.png">
            
          </div>
          <div class="logoutContainer">
            <a href="Authentication?action=Logout"><img src="./Assets/logout.png"></a>
          </div>
        </header>

        <div class ="mainContainer">
            <div class ="contentContainer">
                    <h1>Notas do Aluno</h1>     
                <div class="tableContainer">
                    <table>
                        <tr>
                            <th id="left">Materia</th>
                            <th id="center">N1</th>
                            <th id="center">N2</th>
                            <th id="center">N3</th>
                            <th id="center">NF</th>
                            <th id="center">F</th>
                            <th id="center">Periodo</th>
                        </tr>
                        <%
                    for(int i = 0; i < listReportingSchool.size(); i++){

                        Funcionario funcParam = new Funcionario();
                        funcParam.setIdReg(listReportingSchool.get(i).getFkFunc());

                        Funcionario funcReturn = FuncionarioDAO.getOneEmployeeById(funcParam);
                %>
                        <tr class="trHover">
                            <td id="left" ><%out.print(funcReturn.getGraduation());%></td>
                            <td id="center"><%out.print(listReportingSchool.get(i).getN1());%></td>
                            <td id="center"><%out.print(listReportingSchool.get(i).getN2());%></td>
                            <td id="center"><%out.print(listReportingSchool.get(i).getN3());%></td>
                            <td id="center"><%out.print(listReportingSchool.get(i).getNF());%></td>
                            <td id="center"><%out.print(listReportingSchool.get(i).getF());%></td>
                            <td id="center"><%out.print(listReportingSchool.get(i).getPeriodo());%></td>
                        </tr>

                <%}%>
                </table>
                </div>
                <div class="buttonContainers">
                    <a href="detalhesClasse.jsp?IdReg=<%out.print(idClass);%>"><button>Voltar</button></a>    
                </div>
            </div>
        </div>




        

    </body>
</html>
