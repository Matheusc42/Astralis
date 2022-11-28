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

import DAO.BoletimDAO;
import model.Boletim;

/**
 *
 * @author sfcma
 */
public class BoletimController extends HttpServlet {

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
        
        
        //Capturando string de action
        String action = request.getParameter("action");
        
        
        //::::ACTION::::
        //Novo Boletim
        if(action !=  null && action.equals("novoBoletim")){
            //Capturando parametros
            int FuncFK = Integer.parseInt(request.getParameter("IdFunc"));
            int AlunoFK = Integer.parseInt(request.getParameter("RM"));
            
            //Inicializando objeto parametro boletim
            Boletim boletimParam = new Boletim();
        
            boletimParam.setFkFunc(FuncFK);
            boletimParam.setFkAluno(AlunoFK);
            
            //Inserindo o Boletim
            BoletimDAO.newStudentSchoolReport(boletimParam);

            //Redirecionando
            response.sendRedirect("painelNotas.jsp?RM=" + Integer.toString(AlunoFK) + "&IdReg=" + Integer.toString(FuncFK));
        }
        
        
        
        
        //::::ACTION::::
        //Atualizar Boletim
        if(action !=  null && action.equals("atualizarBoletim")){
        
            //Capturando parametros do Boletim
        int IdReg = Integer.parseInt(request.getParameter("IdReg"));
        int FuncFK = Integer.parseInt(request.getParameter("IdFunc"));
        int AlunoFK = Integer.parseInt(request.getParameter("RM"));
        int N1 = Integer.parseInt(request.getParameter("N1"));
        int N2 = Integer.parseInt(request.getParameter("N2"));
        int N3 = Integer.parseInt(request.getParameter("N3"));
        int NF = (N1 + N2 + N3)/3;
        int F = Integer.parseInt(request.getParameter("F"));
        String Periodo = request.getParameter("Periodo");

        String idClass = request.getParameter("idClass");
        

        //Inicializando objeto parametro boletim
        Boletim boletimParam = new Boletim();
        
        boletimParam.setIdReg(IdReg);
        boletimParam.setFkFunc(FuncFK);
        boletimParam.setFkAluno(AlunoFK);
        boletimParam.setN1(N1);
        boletimParam.setN2(N2);
        boletimParam.setN3(N3);
        boletimParam.setNF(NF);
        boletimParam.setF(F);
        boletimParam.setPeriodo(Periodo);
        
        //Chamando funcao DAO
        BoletimDAO.updateReportSchool(boletimParam);

        //Redirecionando
        response.sendRedirect("painelNotas.jsp?RM=" + Integer.toString(AlunoFK) + "&IdReg=" + Integer.toString(FuncFK)+"&idClass=" + idClass);

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
