/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import database.ConnectDB;

import java.util.List;
import java.util.ArrayList;
import java.util.Date;
import model.Aluno;
import model.Classe;


public class AlunoDAO {


    
    public static List<Aluno> getAllStudents(){

        //Criando List de retorno
        List<Aluno> returnList = new ArrayList<>();

        //Conectando no banco de dados e coletando funcionarios
        try {

            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM alunos ORDER BY RM;");
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                
                //Criando e setando objeto de retorno
                Aluno returnAluno = new Aluno();
                
                returnAluno.setRM(rs.getInt("RM"));
                returnAluno.setName(rs.getString("Name"));
                returnAluno.setRG(rs.getString("RG"));
                returnAluno.setCPF(rs.getString("CPF"));
                returnAluno.setBirthCertificate(rs.getString("birthCertificate"));
                returnAluno.setBirthDate(rs.getDate("birthDate"));
                returnAluno.setResponsavelMae(rs.getString("responsavelMae"));
                returnAluno.setRGMae(rs.getString("RGMae"));
                returnAluno.setCPFMae(rs.getString("CPFMae"));
                returnAluno.setResponsavelPai(rs.getString("reponsavelPai"));
                returnAluno.setRGPai(rs.getString("RGPai"));
                returnAluno.setCPFPai(rs.getString("CPFPai"));
                returnAluno.setMobilePhone(rs.getString("MobilePhone"));
                returnAluno.setPhone(rs.getString("Phone"));
                returnAluno.setMail(rs.getString("Mail"));
                returnAluno.setCEP(rs.getString("CEP"));
                returnAluno.setAddress(rs.getString("Address"));
                returnAluno.setNumber(rs.getString("Number"));
                returnAluno.setDistrict(rs.getString("District"));
                returnAluno.setUF(rs.getString("UF"));
                returnAluno.setBirthCity(rs.getString("birthCity"));
                returnAluno.setCity(rs.getString("City"));
                returnAluno.setIsMatriculado(rs.getBoolean("isMatriculado"));
                returnAluno.setFkClass(rs.getInt("ForeignKeyClass"));

                //Adicionando objeto na lista de retorno
                returnList.add(returnAluno);
            }
            
            con.close();
            
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        
        //Retornando lista de funcionarios
        return returnList;
    }
    
    public static void newStudent(Aluno alunoParam){

        try {
            
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO alunos (`Name`,`RG`,`CPF`,`birthCertificate`,`birthDate`,`responsavelMae`,`RGMae`,`CPFMae`,`reponsavelPai`,`RGPai`, `CPFPai`, `mobilePhone`, `Phone`, `Mail`, `CEP`, `Address`, `Number`, `District`, `UF`, `birthCity`, `isMatriculado`, `City`) VALUES ('" + alunoParam.getName() + "','"+alunoParam.getRG()+"','"+alunoParam.getCPF()+"','"+alunoParam.getBirthCertificate()+"','" + alunoParam.getBirthDate() + "','"+alunoParam.getResponsavelMae()+"','"+alunoParam.getRGMae()+"','"+alunoParam.getCPFMae()+"','"+alunoParam.getResponsavelPai()+"','"+alunoParam.getRGPai()+"','"+alunoParam.getCPFPai()+"','"+alunoParam.getMobilePhone()+"','"+alunoParam.getPhone()+"','"+alunoParam.getMail()+"','"+alunoParam.getCEP()+"','"+alunoParam.getAddress()+"','"+alunoParam.getNumber()+"','"+alunoParam.getDistrict()+"','"+alunoParam.getUF()+"','"+alunoParam.getBirthCity()+"',"+alunoParam.getIsMatriculado()+",'"+alunoParam.getCity()+"');");

            ps.execute();
            con.close();
            
        } catch (SQLException e) {
            System.out.println("Error:"  + e);
        }
    }

    public static void deleteStudent(Aluno alunoParam){

        try{

            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = null;
            ps = con.prepareStatement("DELETE FROM alunos WHERE RM = ?");
            ps.setInt(1, alunoParam.getRM());
            
            ps.execute();
            con.close();

        }catch(SQLException e){
            System.out.println("Error: " + e);
        }
    }

    public static void registerStudent(Aluno alunoParam, Classe classeParam){

        try{

            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = null;
            ps = con.prepareStatement("UPDATE alunos SET ForeignKeyClass = "+classeParam.getIdReg()+", isMatriculado = 1 WHERE RM = "+alunoParam.getRM()+";");
            
            ps.execute();
            con.close();

        }catch(SQLException e){
            System.out.println("Error: " + e);
        }
    }

    public static List<Aluno> getAllStudentsInAClass(Classe classeParam){

        //Criando List de retorno
        List<Aluno> returnList = new ArrayList<>();

        //Conectando no banco de dados e coletando funcionarios
        try {

            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM alunos WHERE ForeignKeyClass = "+classeParam.getIdReg()+" ORDER BY Name ASC;");
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                
                //Criando e setando objeto de retorno
                Aluno returnAluno = new Aluno();

                returnAluno.setRM(rs.getInt("RM"));
                returnAluno.setName(rs.getString("Name"));
                returnAluno.setRG(rs.getString("RG"));
                returnAluno.setBirthDate(rs.getDate("birthDate"));

                returnList.add(returnAluno);
            }
        }catch(SQLException e){
            System.out.println("Error: " + e);
        }

        return returnList;
    }
    
    public static void unregisterStudent(Aluno alunoParam){

        try{

            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = null;
            ps = con.prepareStatement("UPDATE alunos SET ForeignKeyClass = 0, isMatriculado = 0 WHERE RM = "+alunoParam.getRM()+";");
            
            ps.execute();
            con.close();

        }catch(SQLException e){
            System.out.println("Error: " + e);
        }
    }
    
    public static Aluno getOneStudentById (Aluno alunoParam){

        //Criando objeto de retorno
         Aluno returnAluno = new Aluno();

      try {

             //Conectando ao banco de dados e resgatando um funcionario pelo Id
             Connection con = ConnectDB.getConnection();
             PreparedStatement ps = null;
             ps = con.prepareStatement("SELECT * FROM alunos WHERE RM = ?");
             ps.setInt(1, alunoParam.getRM());
             ResultSet rs = ps.executeQuery();

             while(rs.next()){

                 //Setando atributos do objeto de retorno
                 returnAluno.setRM(rs.getInt("RM"));
                 returnAluno.setName(rs.getString("Name"));
                 returnAluno.setRG(rs.getString("RG"));
                 returnAluno.setCPF(rs.getString("CPF"));
                 returnAluno.setBirthCertificate(rs.getString("birthCertificate"));
                 returnAluno.setBirthDate(rs.getDate("birthDate"));
                 returnAluno.setResponsavelMae(rs.getString("responsavelMae"));
                 returnAluno.setRGMae(rs.getString("RGMae"));
                 returnAluno.setCPFMae(rs.getString("CPFMae"));
                 returnAluno.setResponsavelPai(rs.getString("reponsavelPai"));
                 returnAluno.setRGPai(rs.getString("RGPai"));
                 returnAluno.setCPFPai(rs.getString("CPFPai"));
                 returnAluno.setMobilePhone(rs.getString("MobilePhone"));
                 returnAluno.setPhone(rs.getString("Phone"));
                 returnAluno.setMail(rs.getString("Mail"));
                 returnAluno.setCEP(rs.getString("CEP"));
                 returnAluno.setAddress(rs.getString("Address"));
                 returnAluno.setNumber(rs.getString("Number"));
                 returnAluno.setDistrict(rs.getString("District"));
                 returnAluno.setUF(rs.getString("UF"));
                 returnAluno.setBirthCity(rs.getString("BirthCity"));
                 returnAluno.setCity(rs.getString("City"));
          
             }

             //Fechando conexao com o Banco de Dados
             con.close();

         } catch (Exception e) {
             System.out.println("Error: " + e);
         }

         //Retornando objeto Funcionario
         return returnAluno;
     }

    public static void updateStudent(Aluno alunoParam){

         try {
             Connection con = ConnectDB.getConnection();
             PreparedStatement ps = null;
             ps = con.prepareStatement("UPDATE `astralis`.`alunos` SET `Name` = '" + alunoParam.getName() + "' , `RG` = '" + alunoParam.getRG() + "',`CPF` = '" + alunoParam.getCPF() + "',`birthCertificate` = '" + alunoParam.getBirthCertificate() + "',`birthDate` = '" + alunoParam.getBirthDate() + "',`responsavelMae` = '" + alunoParam.getResponsavelMae() + "',`RGMae` = '" + alunoParam.getRGMae() + "',`CPFMae` = '" + alunoParam.getCPFMae() + "',`reponsavelPai` = '" + alunoParam.getResponsavelPai() + "',`RGPai` = '" + alunoParam.getRGPai() + "',`CPFPai` = '" + alunoParam.getCPFPai() + "',`mobilePhone` = '" + alunoParam.getMobilePhone() + "',`Phone` = '" + alunoParam.getPhone() + "',`Mail` = '" + alunoParam.getMail() + "',`CEP` = '" + alunoParam.getCEP() + "',`Address` = '" + alunoParam.getAddress() + "',`Number` = '" + alunoParam.getNumber() + "',`District` = '" + alunoParam.getDistrict() + "', `UF` = '" + alunoParam.getUF() + "',`birthCity` = '" + alunoParam.getBirthCity() + "',`City` = '" + alunoParam.getCity() + "' WHERE `RM` = " + alunoParam.getRM() + ";");
                        
             ps.execute();
             con.close();
            
         } catch (SQLException e) {
             System.out.println("Error: " + e);
         }
     }
}


