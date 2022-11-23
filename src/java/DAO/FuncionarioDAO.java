/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Funcionario;
import database.ConnectDB;

import java.util.List;
import java.util.ArrayList;


public class FuncionarioDAO {

    
    public static List<Funcionario> getAllEmployee(){

        //Criando List de retorno
        List<Funcionario> returnList = new ArrayList<>();

        //Conectando no banco de dados e coletando funcionarios
        try {

            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Funcionario");
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                
                //Criando e setando objeto de retorno
                Funcionario returnFunc = new Funcionario();

                returnFunc.setIdReg(rs.getInt("IdReg"));
                returnFunc.setName(rs.getString("name"));
                returnFunc.setRG(rs.getString("RG"));
                returnFunc.setCPF(rs.getString("CPF"));
                returnFunc.setBirthDate(rs.getDate("BirthDate"));
                returnFunc.setMobilePhone(rs.getString("MobilePhone"));
                returnFunc.setPhone(rs.getString("Phone"));
                returnFunc.setMail(rs.getString("Mail"));
                returnFunc.setCEP(rs.getString("CEP"));
                returnFunc.setAddress(rs.getString("Address"));
                returnFunc.setNumber(rs.getString("Number"));
                returnFunc.setDistrict(rs.getString("District"));
                returnFunc.setCity(rs.getString("City"));
                returnFunc.setUF(rs.getString("UF"));
                returnFunc.setPosition(rs.getString("Position"));
                returnFunc.setGraduation(rs.getString("Graduation"));
                returnFunc.setUser(rs.getString("User"));
                returnFunc.setPwd(rs.getString("Password"));

                //Adicionando objeto na lista de retorno
                returnList.add(returnFunc);
            }
            
            con.close();
            
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        
        //Retornando lista de funcionarios
        return returnList;
    }
    

    public static void newEmployee(Funcionario funcParam){

        try {

            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO funcionario (name, RG, CPF, birthDate, MobilePhone, Phone, Mail, CEP, Address, Number, District, City, UF, Position, Graduation) VALUES ('"+funcParam.getName()+"','"+funcParam.getRG()+"','"+funcParam.getCPF()+"','"+funcParam.getBirthDate()+"','"+funcParam.getMobilePhone()+"','"+funcParam.getPhone()+"','"+funcParam.getMail()+"','"+funcParam.getCEP()+"','"+funcParam.getAddress()+"','"+funcParam.getNumber()+"','"+funcParam.getDistrict()+"','"+funcParam.getCity()+"','"+funcParam.getUF()+"','"+funcParam.getPosition()+"','"+funcParam.getGraduation()+"');");

            ps.execute();
            con.close();
            
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
    }

    public static void deleteEmployee(Funcionario funcParam){

        try{

            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM Funcionario WHERE IdReg = "+funcParam.getIdReg()+";");
            
            ps.execute();
            con.close();

        }catch(SQLException e){
            System.out.println("Error: " + e);
        }
    }

    public static Funcionario getOneEmployeeById (Funcionario funcParam){

        //Criando objeto de retorno
        Funcionario returnFunc = new Funcionario();

        try {

            //Conectando ao banco de dados e resgatando um funcionario pelo Id
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Funcionario WHERE IdReg = " + funcParam.getIdReg() + ";");
            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                //Setando atributos do objeto de retorno

                returnFunc.setIdReg(rs.getInt("IdReg"));
                returnFunc.setName(rs.getString("name"));
                returnFunc.setRG(rs.getString("RG"));
                returnFunc.setCPF(rs.getString("CPF"));
                returnFunc.setBirthDate(rs.getDate("BirthDate"));
                returnFunc.setMobilePhone(rs.getString("MobilePhone"));
                returnFunc.setPhone(rs.getString("Phone"));
                returnFunc.setMail(rs.getString("Mail"));
                returnFunc.setCEP(rs.getString("CEP"));
                returnFunc.setAddress(rs.getString("Address"));
                returnFunc.setNumber(rs.getString("Number"));
                returnFunc.setDistrict(rs.getString("District"));
                returnFunc.setCity(rs.getString("City"));
                returnFunc.setUF(rs.getString("UF"));
                returnFunc.setPosition(rs.getString("Position"));
                returnFunc.setGraduation(rs.getString("Graduation"));
                returnFunc.setUser(rs.getString("User"));
                returnFunc.setPwd(rs.getString("Password"));
            }

            //Fechando conexao com o Banco de Dados
            con.close();

        } catch (Exception e) {
            System.out.println("Error: " + e);
        }

        //Retornando objeto Funcionario
        return returnFunc;
    }

    public static void updateEmployee(Funcionario funcParam){

        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE Funcionario SET Name='"+funcParam.getName()+"', RG = '"+funcParam.getRG()+"', CPF = '"+funcParam.getCPF()+"', BirthDate = '"+funcParam.getBirthDate()+"', MobilePhone = '"+funcParam.getMobilePhone()+"', Phone = '"+funcParam.getPhone()+"', Mail = '"+funcParam.getMail()+"', CEP = '"+funcParam.getCEP()+"', Address = '"+funcParam.getAddress()+"', Number = '"+funcParam.getNumber()+"', District = '"+funcParam.getDistrict()+"', City = '"+funcParam.getCity()+"', UF = '"+funcParam.getUF()+"', Graduation = '"+funcParam.getGraduation()+"'; ");

            ps.execute();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
    }

    public static void createUser (Funcionario funcParam){

        try {
            
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE Funcionario SET user ='" + funcParam.getUser() + "' WHERE IdReg = " + funcParam.getIdReg() + ";");
            ps.execute();
            con.close();
        } catch (Exception e) {
            System.out.println("Error " + e);
        }
    }

    public static Funcionario getEmployeeByUserName(Funcionario funcParam){
        
        //Criando usuario de retorno
        Funcionario funcReturn = new Funcionario();

        //Conectando ao banco de dados e coletando os dados
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT User, Password FROM Funcionario WHERE user = '"+ funcParam.getUser() +"'");
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                funcReturn.setUser(rs.getString("User"));
                funcReturn.setPwd(rs.getString("Password"));
            }

            //Fechando a conexao com o Banco de Dados
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

        //Retornando o funcionario
        return funcReturn;
    }

    public static void deleteUserAndPassword(Funcionario funcParam){

        //Conectando ao Banco de Dados e executando query de delete
        try {

            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE Funcionario SET user = null AND password = null WHERE IdReg="+ funcParam.getIdReg() +";");

            ps.execute();
            con.close();

        } catch (Exception e) {
            System.out.println("Error: "+ e);
        }
    }

    public static void setFirstPassword(Funcionario funcParam){

        try {
            
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE Funcionario SET password='" + funcParam.getPwd() + "' WHERE user = '" + funcParam.getUser() + "';");

            ps.execute();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
    }

    public static List<Funcionario> getAllDocente(){
        
        //Criando lista de retorno
        List<Funcionario> listReturn = new ArrayList<>();

        try{

            //Coletando informacoes do banco
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT IdReg, name, graduation FROM funcionario WHERE position = 'Docente';");
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                //Criando objeto da lista
                Funcionario returnFunc = new Funcionario();

                returnFunc.setIdReg(rs.getInt("IdReg"));
                returnFunc.setName(rs.getString("name"));
                returnFunc.setGraduation(rs.getString("Graduation"));

                listReturn.add(returnFunc);
            }

            con.close();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        //Retornando obj retorno
        return listReturn;
    }
}

