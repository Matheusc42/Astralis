/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.FuncionarioDAO;

import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Funcionario;

/**
 *
 * @author sfcma
 */
public class FuncionarioController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.text.ParseException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        //Recebendo parametro de ação
        String action = request.getParameter("action");

        //Recuperando dados do formulario
        String Name = request.getParameter("Name");
        String RG = request.getParameter("RG");
        String CPF = request.getParameter("CPF");
        String BirthDate = request.getParameter("BirthDate");
        String MobilePhone = request.getParameter("MobilePhone");
        String Phone = request.getParameter("Phone");
        String Mail = request.getParameter("Mail");
        String CEP = request.getParameter("CEP");
        String Address = request.getParameter("Address");
        String Number = request.getParameter("Number");
        String District = request.getParameter("District");
        String City = request.getParameter("City");
        String UF = request.getParameter("UF");
        String Position = request.getParameter("Position");
        String Graduation = request.getParameter("Graduation");

        //Criando e setando objeto de parametro
        Funcionario funcParam = new Funcionario();

        //Criando formator de Data e formatando data para SQL
        SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
        

        funcParam.setName(Name);
        funcParam.setRG(RG);
        funcParam.setCPF(CPF);
        funcParam.setMobilePhone(MobilePhone);
        funcParam.setPhone(Phone);
        funcParam.setMail(Mail);
        funcParam.setCEP(CEP);
        funcParam.setAddress(Address);
        funcParam.setNumber(Number);
        funcParam.setDistrict(District);
        funcParam.setCity(City);
        funcParam.setUF(UF);
        funcParam.setPosition(Position);
        funcParam.setGraduation(Graduation);


        //:::::Action:::::
        //Novo Funcionario
        if(action != null && action.equals("novoFuncionario")){

            //Setando data de nascimento
            java.sql.Date SQLDate = new java.sql.Date(formater.parse(BirthDate).getTime());
            funcParam.setBirthDate(SQLDate);

            //Inserindo o funcionario
            try {
                
                FuncionarioDAO.newEmployee(funcParam);
            } catch (Exception e) {
                System.out.println(e);
            }
            
            //Redirecionando o usuario
            response.sendRedirect("gerenciarFuncionarios.jsp");

        }


        //:::::Action:::::
        //Deletar funcionario
        if(action != null && action.equals("deletarFuncionario")){

            //Resgatando Id do Usuario e setando no obj parametro
            int IdReg = Integer.parseInt(request.getParameter(("IdReg")));
            funcParam.setIdReg(IdReg);

            //Deletando o funcionario
            FuncionarioDAO.deleteEmployee(funcParam);

            //Redirecionando para a tela de gerenciamento
            response.sendRedirect("gerenciarFuncionarios.jsp");
        }
    
        
        //:::::Action:::::
        //Atualizar Funcionario
        if(action != null && action.equals("atualizarFuncionario")){
            
            //Resgatando Id do Usuario e setando no obj parametro
            int IdReg = Integer.parseInt(request.getParameter(("IdReg")));
            funcParam.setIdReg(IdReg);

            //Setando data de nascimento
            java.sql.Date SQLDate = new java.sql.Date(formater.parse(BirthDate).getTime());
            funcParam.setBirthDate(SQLDate);

            //Atualizando o funcionario
            FuncionarioDAO.updateEmployee(funcParam);

            //Redirecionando para a pagina de gerenciamento
            response.sendRedirect("gerenciarFuncionarios.jsp");

        }
    
        //:::::Action:::::
        //Novo Acesso
        if(action != null && action.equals("novoAcesso")){

            //Recuperando o parametro de UserName e Id
            String userName = request.getParameter("userName");
            int IdReg = Integer.parseInt(request.getParameter("IdReg"));

            //Setando UserName e Id no objeto de parametro
            funcParam.setUser(userName);
            funcParam.setIdReg(IdReg);

            //Checando se Usuario ja existe
            Funcionario funcFinal = FuncionarioDAO.getEmployeeByUserName(funcParam);
            if(funcFinal.getUser() != null){

                //Redirecionando e setando mensagem de erro na sessao
                String msg = "userAlreadyExist";
                request.getSession().setAttribute("msg", msg);
                response.sendRedirect("atualizarFuncionario.jsp?IdReg=" + Integer.toString(funcParam.getIdReg()));

            } else {

                //Chamando função DAO para criar Usuario
                FuncionarioDAO.createUser(funcParam);
    
                //Redirecionando e criando mensagem de sucesso na sessao
                String msg = "userCreate";
                request.getSession().setAttribute("msg", msg);
                response.sendRedirect("atualizarFuncionario.jsp?IdReg=" + Integer.toString(funcParam.getIdReg()));
            }

        }

        //:::::Action:::::
        //Remover acesso
        if(action != null && action.equals("excluirAcesso")){

            //Recuperando parametros da Url
            int IdReg = Integer.parseInt(request.getParameter("IdReg"));

            //Criando objeto de parametro
            funcParam.setIdReg(IdReg);

            //Invocando metodo estatico de delete do acesso
            FuncionarioDAO.deleteUserAndPassword(funcParam);

            //Redirecionando Usuario e setando mensagem de sucesso via sessao
            String msg = "deleteAccess";
            request.getSession().setAttribute("msg", msg);
            response.sendRedirect("gerenciarFuncionarios.jsp");


        }
        
        //:::::Action:::::
        //Remover acesso
        if(action != null && action.equals("primeiraSenha")){

            //Recuperando parametros 
            String user = request.getParameter("userName");
            String pwd = request.getParameter("password");

            //Setando atributos do objeto de parametro
            funcParam.setUser(user);
            funcParam.setPwd(pwd);

            //Coletando dados do banco de dados para verificação
            Funcionario funcReturn = FuncionarioDAO.getEmployeeByUserName(funcParam);

            //Caso usuario ja tenha senha cadastrada
            if(funcReturn.getPwd() != null){

                //Setando mensagem de erro na session e redirecionando a pagina de login
                String msg = "alreadyHavePwd";
                request.getSession().setAttribute("msg", msg);
                response.sendRedirect("loginScreen.jsp");

            } 
            
            //Caso Usuario nao exista
            else if (funcReturn.getUser() == null){

                //Setando mensagem de erro na session e redirecionando a pagina de login
                String msg = "userNotExist";
                request.getSession().setAttribute("msg", msg);
                response.sendRedirect("loginScreen.jsp");

            } 

            //Definindo a primeira senha com sucesso
            else{

                //Chamando function DAO que define a senha
                FuncionarioDAO.setFirstPassword(funcParam);

                //Redirecionando com mensagem de sucesso
                String msg = "passwordSet";
                request.getSession().setAttribute("msg", msg);
                response.sendRedirect("loginScreen.jsp");

            }

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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(FuncionarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(FuncionarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
