/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import DAO.AlunoDAO;
import DAO.FuncionarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Aluno;

/**
 *
 * @author BINHO
 */
//
public class AlunoController extends HttpServlet {
    
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        //Recebendo parametro de ação
        String action = request.getParameter("action");
      
        int Rm = Integer.parseInt(request.getParameter("RM"));
        String fullName = request.getParameter("FullName");
        String RG = request.getParameter("RG");
        String CPF = request.getParameter("CPF");
        String BirthCertificate = request.getParameter("BirthCertificate");
        String dataNasc = request.getParameter("birthDate");
        String responsavelMae = request.getParameter("responsavelMae");
        String RGMae = request.getParameter("RGMae");
        String CPFMae = request.getParameter("CPFMae");
        String responsavelPai= request.getParameter("responsavelPai");
        String RGPai= request.getParameter("RGPai");
        String CPFPai= request.getParameter("CPFPai");
        String MobilePhone = request.getParameter("MobilePhone");
        String Phone = request.getParameter("Phone");
        String mail = request.getParameter("Mail");
        String CEP = request.getParameter("CEP");
        String Address = request.getParameter("Address");
        String Number = request.getParameter("Number");
        String District = request.getParameter("District");
        String UF = request.getParameter("UF");
        String birthCity = request.getParameter("birthCity");   
        String isMatriculado = request.getParameter("isMatriculado");
        String FkClass = request.getParameter("FkClass");
        
        Aluno alunoParam = new Aluno();
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        //Variavel data
        java.sql.Date SQLDate = new java.sql.Date(sdf.parse(dataNasc).getTime());
        
        alunoParam.setFullName(fullName);
        alunoParam.setRG(RG);
        alunoParam.setCPF(CPF);
        alunoParam.setBirthCertificate(BirthCertificate);
        alunoParam.setDataNasc(SQLDate);
        alunoParam.setResponsavelMae(responsavelMae);
        alunoParam.setRGMae(RGMae);
        alunoParam.setCPFMae(CPFMae);
        alunoParam.setResponsavelPai(responsavelPai);
        alunoParam.setRGPai(RGPai);
        alunoParam.setRGPai(RGPai);
        alunoParam.setMobilePhone(MobilePhone);
        alunoParam.setPhone(Phone);
        alunoParam.setMail(mail);
        alunoParam.setCEP(CEP);
        alunoParam.setAddress(Address);
        alunoParam.setNumber(Number);
        alunoParam.setDistrict(District);
        alunoParam.setUF(UF);
        alunoParam.setCity(birthCity);
        alunoParam.setIsMatriculado(true);
        alunoParam.setFkClass(0);
        
        
        //Novo Aluno
        if(action != null && action.equals("novoAluno")){

            //Setando data de nascimento
            alunoParam.setDataNasc(SQLDate);

            //Inserindo o Aluno
            try {
                
                AlunoDAO.newStudent(alunoParam);
            } catch (Exception e) {
                System.out.println(e);
            }
            
            //Redirecionando o usuario
            response.sendRedirect("gerenciarAlunos.jsp");

        }
        
         //Atualizar Funcionario
        if(action != null && action.equals("atualizaAluno")){
            
            //Resgatando Id do Usuario e setando no obj parametro
            Rm = Integer.parseInt(request.getParameter(("Rm")));
            alunoParam.setRm(Rm);

            //Setando data de nascimento
            alunoParam.setDataNasc(SQLDate);

            //Atualizando o funcionario
            AlunoDAO.updateStudent(alunoParam);

            //Redirecionando para a pagina de gerenciamento
            response.sendRedirect("gerenciarAlunos.jsp");

        }
    }
}