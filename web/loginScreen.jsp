<%@page import="model.Funcionario"%>
<% 
       Funcionario user = (Funcionario) request.getSession().getAttribute("user");
       if(user != null) {
          response.sendRedirect("mainMenu.jsp");
       }
     %>
<!DOCTYPE html>
<html lang="pt-BR">
  <head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap" rel="stylesheet">
    <script type="text/javascript" src="./Js/modal.js"></script>
    <link rel="stylesheet" href="./CSS/modal.css" />
    <link rel="stylesheet" href="./CSS/Login/loginScreen.css" />
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Astralis | Entrar</title>
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
              placeholder="Usuario"
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

    <div class=pageContainer>
      <div class="loginContainer">
        <img src="./Assets/Logo_G.png">
        <div class="formContainer">
          <form action="Authentication?action=Authentication" method="post">
            <input type="text" name="user" required placeholder="Usuario"/>
            <input type="password" name="pwd" required placeholder="Senha"/>
              <%
                if(msg != null && msg.equals("error")){
                  out.print("<br><br> Usuario ou senha incorretos!");
                  request.getSession().removeAttribute("msg");
                } else if(msg != null && msg.equals("alreadyHavePwd")){
                  out.print("<br><br> Usuario ja possui senha cadastrada!");
                  request.getSession().removeAttribute("msg");
                } else if(msg != null && msg.equals("userNotExist")){
                  out.print("<br><br> Usuario não localizado!");
                  request.getSession().removeAttribute("msg");
                } else if(msg != null && msg.equals("passwordSet")){
                  out.print("<br><br> Senha criada com sucesso!");
                  request.getSession().removeAttribute("msg");
                }
              %>
            <input type="submit" value="Entrar" />
            <p onclick="openModal()">Primeiro Acesso</p>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
