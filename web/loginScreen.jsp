<!DOCTYPE html>
<html lang="pt-BR">
  <head>
    <script type="text/javascript" src="./Js/modal.js"></script>
    <link rel="stylesheet" href="./CSS/modal.css" />
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Entrar</title>
  </head>
  <%
    
    String msg = (String) request.getSession().getAttribute("msg");
    
  %>
  <body>


    <div class="modalBG" id="modal">
      <div class="modalContainer">
        <h2>Primeiro Acesso</h2>
        <hr />
        <br />
        <div class="formContainer">
          <form action="Funcionario?action=primeiraSenha" method="post">
            <input
              type="text"
              name="userName"
              id="userName"
              placeholder="Nome de Usuario"
            /><br />
            <input
              type="password"
              name="password"
              id="pwd"
              placeholder="Senha"
            /><br />
            <input type="submit" value="Criar Senha" /> <br />
          </form>
          <button onclick="closeModal()">Cancelar</button>
        </div>
      </div>
    </div>

    
    <form action="Authentication?action=Authentication" method="post">
      <label for="user">Usuario</label>
      <br />
      <input type="text" name="user" required/>
      <br /><br />
      <label for="pwd">Senha</label>
      <br />
      <input type="password" name="pwd" required/>
      <%
        if(msg != null && msg.equals("error")){
          out.print("<br> Usuario ou senha incorretos!");
          request.getSession().removeAttribute("msg");
        } else if(msg != null && msg.equals("alreadyHavePwd")){
          out.print("<br> Usuario ja possui senha cadastrada!");
          request.getSession().removeAttribute("msg");
        } else if(msg != null && msg.equals("userNotExist")){
          out.print("<br> Usuario não localizado!");
          request.getSession().removeAttribute("msg");
        } else if(msg != null && msg.equals("passwordSet")){
          out.print("<br> Senha criada com sucesso!");
          request.getSession().removeAttribute("msg");
        }
      %>
      <br />
      <br />
      <input type="submit" value="Login" />
    </form>


    <button onclick="openModal()">Primeiro Acesso</button>
  </body>
</html>
