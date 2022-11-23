/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

import DAO.AuthenticationDAO;
import model.Funcionario;

/**
 *
 * @author sfcma
 */
public class Authentication extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
       
        //Recebendo parametro de ação
        String action = request.getParameter("action");

        
        //::::Action::::
        //Autenticar Usuario
        if(action != null && action.equals("Authentication")){
            
            //Capturando parametros do formulario
            String user = request.getParameter("user");
            String pwd = request.getParameter("pwd");

            //Criando objeto de parametro
            Funcionario funcParam = new Funcionario();

            //Setando atributos do obj parametro com dados do formulario
            funcParam.setUser(user);
            funcParam.setPwd(pwd);
            
            if(user != null && !user.isEmpty() && pwd != null && !pwd.isEmpty()){

                //Resgatando dados do banco de dados via DAO e obj de retorno
                Funcionario returnFunc = AuthenticationDAO.getAuthentication(funcParam);
        
                //Autenticação bem sucedida
                if(returnFunc.getUser() != null){

                    //Criando objeto Funcionario na sessão
                    request.getSession().setAttribute("user", returnFunc);

                    //Redirecionando ao Menu Principal
                    response.sendRedirect("mainMenu.jsp"); 
                }

                //Senha ou Usuarios incorretos
                if(returnFunc.getUser() == null || returnFunc.getUser().isEmpty()){

                    //Setando mensagem de erro na sessao
                    String msg = "error";
                    request.getSession().setAttribute("msg", msg);

                    //Redirecionando para a página de Login
                    response.sendRedirect("loginScreen.jsp");
                }
            }
        }
        



        //::::Action::::
        //Deslogar Usuario
        if(action != null && action.equals("Logout")){
            
            //Encerrando a Sessao
            request.getSession().invalidate();

            //Redirecionando para a página de Login
            response.sendRedirect("loginScreen.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}