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
import model.Aluno;


public class AlunoDAO {


    
    public static List<Aluno> getAllStudents(){

        //Criando List de retorno
        List<Aluno> returnList = new ArrayList<>();

        //Conectando no banco de dados e coletando funcionarios
        try {

            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM alunos;");
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
            PreparedStatement ps = con.prepareStatement("INSERT INTO alunos (`Name`,`RG`,`CPF`,`birthCertificate`,`birthDate`,`responsavelMae`,`RGMae`,`CPFMae`,`reponsavelPai`,`RGPai`, `CPFPai`, `mobilePhone`, `Phone`, `Mail`, `CEP`, `Address`, `Number`, `District`, `UF`, `birthCity`, `isMatriculado`, `City`) VALUES ('" + alunoParam.getName() + "','"+alunoParam.getRG()+"','"+alunoParam.getCPF()+"','"+alunoParam.getBirthCertificate()+"','" + alunoParam.getBirthDate() + "','"+alunoParam.getResponsavelMae()+"','"+alunoParam.getRGMae()+"','"+alunoParam.getCPFMae()+"','"+alunoParam.getResponsavelPai()+"','"+alunoParam.getRGPai()+"','"+alunoParam.getCPFPai()+"','"+alunoParam.getMobilePhone()+"','"+alunoParam.getPhone()+"','"+alunoParam.getMail()+"','"+alunoParam.getCEP()+"','"+alunoParam.getAddress()+"','"+alunoParam.getNumber()+"','"+alunoParam.getDistrict()+"','"+alunoParam.getUF()+"','"+alunoParam.getBirthCity()+"',"+alunoParam.isIsMatriculado()+",'"+alunoParam.getCity()+"');");

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

    // public static Aluno getStudentById (Aluno alunoParam){

    //     //Criando objeto de retorno
    //     Aluno returnAluno = new Aluno();

    //     try {

    //         //Conectando ao banco de dados e resgatando um funcionario pelo Id
    //         Connection con = ConnectDB.getConnection();
    //         PreparedStatement ps = null;
    //         ps = con.prepareStatement("SELECT * FROM alunos WHERE RM = ?");
    //         ps.setDouble(1, alunoParam.getRm());
    //         ResultSet rs = ps.executeQuery();

    //         while(rs.next()){

    //             //Setando atributos do objeto de retorno
    //             returnAluno.setRm(rs.getInt("RM"));
    //             returnAluno.setFullName(rs.getString("fullName"));
    //             returnAluno.setRG(rs.getString("RG"));
    //             returnAluno.setCPF(rs.getString("CPF"));
    //             returnAluno.setBirthCertificate(rs.getString("birthCertificate"));
    //             returnAluno.setDataNasc(rs.getDate("birthDate"));
    //             returnAluno.setResponsavelMae(rs.getString("responsavelMae"));
    //             returnAluno.setRGMae(rs.getString("RGMae"));
    //             returnAluno.setCPFMae(rs.getString("CPFMae"));
    //             returnAluno.setResponsavelPai(rs.getString("responsavelPai"));
    //             returnAluno.setRGPai(rs.getString("RGPai"));
    //             returnAluno.setCPFPai(rs.getString("CPFPai"));
    //             returnAluno.setMobilePhone(rs.getString("MobilePhone"));
    //             returnAluno.setPhone(rs.getString("Phone"));
    //             returnAluno.setMail(rs.getString("Mail"));
    //             returnAluno.setCEP(rs.getString("CEP"));
    //             returnAluno.setAddress(rs.getString("Address"));
    //             returnAluno.setNumber(rs.getString("Number"));
    //             returnAluno.setDistrict(rs.getString("District"));
    //             returnAluno.setUF(rs.getString("UF"));
    //             returnAluno.setCity(rs.getString("birthCity"));
    //             returnAluno.setIsMatriculado(rs.getBoolean("isMatriculado"));
    //             returnAluno.setFkClass(rs.getInt("ForeignKeyClass"));
          
    //         }

    //         //Fechando conexao com o Banco de Dados
    //         con.close();

    //     } catch (Exception e) {
    //         System.out.println("Error: " + e);
    //     }

    //     //Retornando objeto Funcionario
    //     return returnAluno;
    // }

    // public static void updateStudent(Aluno alunoParam){

    //     try {
    //         Connection con = ConnectDB.getConnection();
    //         PreparedStatement ps= null;
    //         ps = con.prepareStatement("UPDATE alunos SET Name = ?, RG = ?, CPF = ?, birthCertificate = ?, birthDate = ?, responsavelMae = ?, RGMae = ?, CPFMae = ?, responsavelPai = ?, RGPai = ?, CPFPai = ?, mobilePhone = ?, Phone = ?, Mail = ?, CEP = ?, Address = ?, Number = ?, District = ?, UF = ?, birthCity = ?, isMatriculado = ?, ForeignKeyClass = ? WHERE RM = ?;");
            
    //         ps.setString(1, alunoParam.getFullName());
    //         ps.setString(2,alunoParam.getRG());
    //         ps.setString(3,alunoParam.getCPF());
    //         ps.setString(4,alunoParam.getBirthCertificate());
    //         ps.setDate(5, (Date) alunoParam.getDataNasc());
    //         ps.setString(6,alunoParam.getResponsavelMae());
    //         ps.setString(7,alunoParam.getRGMae());
    //         ps.setString(8,alunoParam.getCPFMae());
    //         ps.setString(9,alunoParam.getResponsavelPai());
    //         ps.setString(10,alunoParam.getRGPai());
    //         ps.setString(11,alunoParam.getCPFPai());
    //         ps.setString(12,alunoParam.getMobilePhone());
    //         ps.setString(13,alunoParam.getPhone());
    //         ps.setString(14,alunoParam.getMail());
    //         ps.setString(15,alunoParam.getCEP());
    //         ps.setString(16,alunoParam.getAddress());
    //         ps.setString(17,alunoParam.getNumber());
    //         ps.setString(18,alunoParam.getDistrict());
    //         ps.setString(19,alunoParam.getUF());
    //         ps.setString(20,alunoParam.getBirthCity());
    //         ps.setBoolean(21,alunoParam.getIsIsMatriculado());
    //         ps.setInt(22,alunoParam.getFkClass());
    //         ps.setDouble(23, alunoParam.getRm());
            
    //         ps.execute();
    //         con.close();
            
    //     } catch (SQLException e) {
    //         System.out.println("Error: " + e);
    //     }
    // }
}


