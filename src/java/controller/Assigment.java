/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AssigmentDAO;
import model.Classe;
import model.Funcionario;

/**
 *
 * @author sfcma
 */
public class Assigment extends HttpServlet {

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
        
        //Capturando parametro de action
        String action = request.getParameter("action");

        //::::Action::::
        //Criar uma nova Atribuição
        if(action != null && action.equals("novaAtr")){

            //Capturando parametros
            int idFunc = Integer.parseInt(request.getParameter("idFunc"));
            int idClasse = Integer.parseInt(request.getParameter("idClasse"));
            
            //Criando objetos de parametrização
            Funcionario funcParam = new Funcionario();
            funcParam.setIdReg(idFunc);

            Classe classeParam = new Classe();
            classeParam.setIdReg(idClasse);

            //Criando nova atribuição de aula
            AssigmentDAO.newAssigment(classeParam, funcParam);

            //Setando mensagem de sucesso e redirecionando
            String msg = "successAssigment";
            request.getSession().setAttribute("msg", msg);
            response.sendRedirect("painelAtribuicao.jsp?IdReg=" + Integer.toString(idClasse));
            

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
