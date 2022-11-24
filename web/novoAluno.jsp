
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Astralis | Novo Aluno</title>
    </head>
    <body>
       <a href="gerenciarAlunos.jsp"><button>Voltar</button></a>    
       <h1>Novo Aluno</h1>
       
       <form action="Aluno?action=novoAluno" method="post">
       Nome: <input type="text" name="Name" /> <br>
       RG: <input type="text" name="RG" /> <br>
       CPF: <input type="text" name="CPF" /> <br>
       Certidão de Nascimento: <input type="text" name="BirthCertificate" /> <br>
       Data de Nascimento: <input type="date" name="BirthDate" /> <br>
       Nome da Mãe: <input type="text" name="ResponsavelMae" /> <br>
       RG: <input type="text" name="RGMae" /> <br>
       CPF: <input type="text" name="CPFMae" /> <br>
       Nome do Pai: <input type="text" name="ResponsavelPai" /> <br>
       RG: <input type="text" name="RGPai" /> <br>
       CPF: <input type="text" name="CPFPai" /> <br>
       Celular: <input type="text" name="MobilePhone" /> <br>
       Telefone: <input type="text" name="Phone" /> <br>
       E-mail: <input type="text" name="Mail" /> <br>
       CEP: <input type="text" name="CEP" /> <br>
       Endereço: <input type="text" name="Address" /> <br>
       N°: <input type="text" name="Number" /> <br>
       Bairro: <input type="text" name="District" /> <br>
       Cidade: <input type="text" name="City" /> <br>
       Estado:
      <select id="estado" name="UF">
        <option value=""></option>
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
      Cidade de Nascimento: <input type="text" name="BirthCity" /> <br>
      <input type="submit" value="Cadastrar"/>
       </form>
    </body>
</html>
