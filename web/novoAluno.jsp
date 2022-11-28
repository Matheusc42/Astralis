
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
        <link rel="stylesheet" href="./CSS/formLayout.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Astralis | Novo Aluno</title>
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

        <div class="mainContainer">
            <div class="contentContainer">
                <h1>Novo Aluno</h1>
                    <form action="Aluno?action=novoAluno" method="post">
                        <input type="text" name="Name" placeholder="Nome"/> 
                        <input type="text" name="RG" placeholder="RG"/> 
                        <input type="text" name="CPF" placeholder="CPF"/> 
                        <input type="text" name="BirthCertificate" placeholder="Cert. de Nasc."/> 
                        <input type="date" name="BirthDate" placeholder="Data de Nascimento"/> 
                        <input type="text" name="ResponsavelMae" placeholder="Nome da mãe"/> 
                        <input type="text" name="RGMae" placeholder="RG da mãe"/> 
                        <input type="text" name="CPFMae" placeholder="CPF da mãe"/> 
                        <input type="text" name="ResponsavelPai" placeholder="Nome do pai"/> 
                        <input type="text" name="RGPai" placeholder="RG do pai"/> 
                        <input type="text" name="CPFPai" placeholder="CPF do pai"/> 
                        <input type="text" name="MobilePhone" placeholder="Celular"/> 
                        <input type="text" name="Phone" placeholder="Telefone"/> 
                        <input type="text" name="Mail" placeholder="E-mail"/> 
                        <input type="text" name="CEP" placeholder="CEP"/> 
                        <input type="text" name="Address" placeholder="Endereço"/> 
                        <input type="text" name="Number" placeholder="N°"/> 
                        <input type="text" name="District" placeholder="Bairro"/> 
                        <input type="text" name="City" placeholder="Cidade"/> 
                        <select id="estado" name="UF" placeholder="Estado">
                            <option value="" disabled selected>Estado</option>
                            <option value="AC">Acre</option>
                            <option value="AL">Alagoas</option>
                            <option value="AP">Amapá</option>
                            <option value="AM">Amazonas</option>
                            <option value="BA">Bahia</option>
                            <option value="CE">Ceará</option>
                            <option value="DF">Distrito Federal</option>
                            <option value="ES">Espírito Santo</option>
                            <option value="GO">Goiás</option>
                            <option value="MA">Maranhão</option>
                            <option value="MT">Mato Grosso</option>
                            <option value="MS">Mato Grosso do Sul</option>
                            <option value="MG">Minas Gerais</option>
                            <option value="PA">Pará</option>
                            <option value="PB">Paraíba</option>
                            <option value="PR">Paraná</option>
                            <option value="PE">Pernambuco</option>
                            <option value="PI">Piauí</option>
                            <option value="RJ">Rio de Janeiro</option>
                            <option value="RN">Rio Grande do Norte</option>
                            <option value="RS">Rio Grande do Sul</option>
                            <option value="RO">Rondônia</option>
                            <option value="RR">Roraima</option>
                            <option value="SC">Santa Catarina</option>
                            <option value="SP">São Paulo</option>
                            <option value="SE">Sergipe</option>
                            <option value="TO">Tocantins</option>
                            <option value="EX">Estrangeiro</option>
                        </select>
                        <br>
                        <input type="text" name="BirthCity" placeholder="Cidade de Nascimento"/> 
                        <button>Cadastrar</button>
                    </form>
                <div class="buttonContainers">
                    <a href="gerenciarAlunos.jsp"><button>Voltar</button></a>    
                </div>
            </div>
        </div>


       
    </body>
</html>
