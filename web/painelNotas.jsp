
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
        int RM = Integer.parseInt(request.getParameter("RM"));
        String idClass = request.getParameter("idClass");

        Aluno alunoParam = new Aluno();
        alunoParam.setRM(RM);

        Funcionario funcParam = new Funcionario();
        funcParam.setIdReg(user.getIdReg());

        Funcionario currentFunc = FuncionarioDAO.getOneEmployeeById(funcParam);

        List<Boletim> listReportingSchool = BoletimDAO.getAllStudentSchoolReportByOneFunc(alunoParam, funcParam);
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

        <div class="mainContainer">
            <div class="contentContainer">
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
                            <th id="center">Editar</th>
                        </tr>
                        <%
                            for(int i = 0; i < listReportingSchool.size(); i++){   
                        %>
                        <tr>
                        <form action="Boletim?action=atualizarBoletim" method="post">
                            <input type="text" name="idClass" value="<% out.print(idClass);%>" hidden/>
                            <input type="text" name="IdReg" value="<% out.print(listReportingSchool.get(i).getIdReg());%>" hidden/>
                            <input type="text" name="IdFunc" value="<% out.print(listReportingSchool.get(i).getFkFunc());%>" hidden/>
                            <input type="text" name="RM" value="<% out.print(listReportingSchool.get(i).getFkAluno());%>" hidden/>
                            <td id="left"><%out.print(currentFunc.getGraduation());%></td>
                            <td id="center"><input type=text name="N1" value="<% out.print(listReportingSchool.get(i).getN1());%>"/></td>
                            <td id="center"><input type=text name="N2" value="<% out.print(listReportingSchool.get(i).getN2());%>"/></td>
                            <td id="center"><input type=text name="N3" value="<% out.print(listReportingSchool.get(i).getN3());%>"/></td>
                            <td id="center"><input type=text name="NF" value="<% out.print(listReportingSchool.get(i).getNF());%>" readonly/></td>
                            <td id="center"><input type=text name="F" value="<% out.print(listReportingSchool.get(i).getF());%>"/></td>
                            <td id="center">
                                <select>
                                    <option value="" disabled selected> <% out.print(listReportingSchool.get(i).getPeriodo());%> </option>
                                    <option value="1° Bim">1° Bim</option>
                                    <option value="2° Bim">2° Bim</option>
                                    <option value="3° Bim">3° Bim</option>
                                    <option value="4° Bim">4° Bim</option>
                                </select>
                            </td>
                            <td id="center"><button>Salvar</button></td>
                        </form>
                        </tr>
                        <%
                            }
                            %>
                    </table>
                </div>
                <div class="buttonContainers">
                    <a href="salaDeAula.jsp?IdReg=<%out.print(idClass);%>"><button>Voltar</button></a>    
                    <a href="Boletim?action=novoBoletim&IdFunc=<%out.print(user.getIdReg());%>&RM=<%out.print(RM);%>"><button>Adicionar Boletim</button></a>
                </div>
            <div>
        </div>


        
    </body>
</html>
