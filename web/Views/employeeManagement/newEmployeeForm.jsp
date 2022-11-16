<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Novo Funcionario</title>
  </head>
  <body>
  <h1> Novo Funcionário </h1>
    <form action="newEmployee.jsp" method="post">
      <label for="name"> Nome: </label>
      <input type="text" name="name" /> <br />
      <label for="RG">RG: </label>
      <input type="text" name="RG" /> <br />
      <label for="CPF">CPF: </label>
      <input type="text" name="CPF" /> <br />
      <label for="birthDate">Data de Nascimento: </label>
      <input type="date" name="birthDate" /> <br />
      <label for="mobilePhone">Celular: </label>
      <input type="text" name="mobilePhone" /> <br />
      <label for="Phone">Telefone: </label>
      <input type="text" name="Phone" /> <br />
      <label for="Mail">Email: </label>
      <input type="text" name="Mail" /> <br />
      <label for="Address">Endereço: </label>
      <input type="text" name="Address" /> <br />
      <label for="City">Cidade: </label>
      <input type="text" name="City" /> <br />
      <label for="UF">UF: </label>
      <input type="text" name="UF" /> <br />
      <label for="Position">Cargo: </label>
      <select name="Position">
        <option value="Direção">Direção</option>
        <option value="Coordenção">Coordenação</option>
        <option value="Docente">Docente</option>
        <option value="Secretário">Secretário</option>
      </select>
      <br />
      <input type="submit" value="Cadastrar" />
    </form>
  </body>
</html>
