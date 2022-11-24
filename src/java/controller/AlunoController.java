package controller;

import DAO.AlunoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Aluno;
import model.Classe;

/**
 *
 * @author sfcma
 */
public class AlunoController extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //Recebendo parametro de ação
        String action = request.getParameter("action");
      
        //Recebendo parametros do formulario
        
        String Name = request.getParameter("Name");
        String RG = request.getParameter("RG");
        String CPF = request.getParameter("CPF");
        String BirthCertificate = request.getParameter("BirthCertificate");
        String BirthDate = request.getParameter("BirthDate");
        String ResponsavelMae = request.getParameter("ResponsavelMae");
        String RGMae = request.getParameter("RGMae");
        String CPFMae = request.getParameter("CPFMae");
        String ResponsavelPai= request.getParameter("ResponsavelPai");
        String RGPai= request.getParameter("RGPai");
        String CPFPai= request.getParameter("CPFPai");
        String MobilePhone = request.getParameter("MobilePhone");
        String Phone = request.getParameter("Phone");
        String mail = request.getParameter("Mail");
        String CEP = request.getParameter("CEP");
        String Address = request.getParameter("Address");
        String Number = request.getParameter("Number");
        String District = request.getParameter("District");
        String City = request.getParameter("City");
        String UF = request.getParameter("UF");
        String birthCity = request.getParameter("birthCity");   
        
        //Objeto Parametro
        Aluno alunoParam = new Aluno();
        
        //Formatador de data
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        

        
        
        alunoParam.setName(Name);
        alunoParam.setRG(RG);
        alunoParam.setCPF(CPF);
        alunoParam.setBirthCertificate(BirthCertificate);
        alunoParam.setResponsavelMae(ResponsavelMae);
        alunoParam.setRGMae(RGMae);
        alunoParam.setCPFMae(CPFMae);
        alunoParam.setResponsavelPai(ResponsavelPai);
        alunoParam.setRGPai(RGPai);
        alunoParam.setCPFPai(CPFPai);
        alunoParam.setMobilePhone(MobilePhone);
        alunoParam.setPhone(Phone);
        alunoParam.setMail(mail);
        alunoParam.setCEP(CEP);
        alunoParam.setAddress(Address);
        alunoParam.setNumber(Number);
        alunoParam.setDistrict(District);
        alunoParam.setCity(City);
        alunoParam.setUF(UF);
        alunoParam.setBirthCity(birthCity);
        alunoParam.setIsMatriculado(false);
        
        //::::ACTION::::
        //Novo Aluno
        if(action != null && action.equals("novoAluno")){

            //Setando data de nascimento
            java.sql.Date SQLDate = new java.sql.Date(sdf.parse(BirthDate).getTime());
            alunoParam.setBirthDate(SQLDate);

            //Inserindo o Aluno
            try {
                AlunoDAO.newStudent(alunoParam);
            } catch (Exception e) {
                System.out.println(e);
            }
            
            //Redirecionando o usuario
            response.sendRedirect("gerenciarAlunos.jsp");

        }
    

        //::::ACTION::::
        //Deletar Aluno
        if(action != null && action.equals("deletarAluno")){

            //Capturando e setando o ID
            int RM = Integer.parseInt(request.getParameter("RM"));
            alunoParam.setRM(RM);

            //Passando objeto parametro pra AlunoDAO
            AlunoDAO.deleteStudent(alunoParam);

            //Redirecionando para a tela de gerenciamento
            response.sendRedirect("gerenciarAlunos.jsp");
        }
    

        //::::ACTION::::
        //Atualizar Aluno
        if(action != null && action.equals("atualizarAluno")){

            //Capturando e setando o RM
            int RM = Integer.parseInt(request.getParameter("RM"));
            alunoParam.setRM(RM);

            //Setando data de nascimento
            java.sql.Date SQLDate = new java.sql.Date(sdf.parse(BirthDate).getTime());
            alunoParam.setBirthDate(SQLDate);

            //Passando objParametro para a função DAO
            AlunoDAO.updateStudent(alunoParam);

            //Redirecionando para a pagina de gerenciamento
            response.sendRedirect("gerenciarAlunos.jsp");
        }
 
    
        //::::ACTION::::
        //Matricular Aluno
        if(action != null && action.equals("matricularAluno")){

            //Recuperando parametros do obj aluno
            int RM = Integer.parseInt(request.getParameter("RM"));
            alunoParam.setRM(RM);

            //Recuperando parametros do obj classe
            Classe classeParam = new Classe();

            int IdClasse = Integer.parseInt(request.getParameter("IdClasse"));
            classeParam.setIdReg(IdClasse);

            //Passando objetos de parametro para a DAO
            AlunoDAO.registerStudent(alunoParam, classeParam);

            //Redirecionando para o gerenciamento de alunos.
            response.sendRedirect("gerenciarAlunos.jsp");

        }
        


        //::::ACTION::::
        //Cancelar Matricula
        if(action != null && action.equals("excluirMatricula")){

            //Recuperando parametros do obj aluno
            int RM = Integer.parseInt(request.getParameter("RM"));
            alunoParam.setRM(RM);
            out.print(RM);
            //Recuperando parametros do obj classe
            int IdClasse = Integer.parseInt(request.getParameter("IdClasse"));
            out.print(IdClasse);
            
            //Passando objetos de parametro para a DAO
            AlunoDAO.unregisterStudent(alunoParam);

            //Redirecionando para o gerenciamento de alunos.
            response.sendRedirect("detalhesClasse.jsp?IdReg=" + Integer.toString(IdClasse));

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
            Logger.getLogger(AlunoController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AlunoController.class.getName()).log(Level.SEVERE, null, ex);
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
