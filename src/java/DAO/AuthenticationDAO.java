/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import database.ConnectDB;
import model.Funcionario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author sfcma
 */
public class AuthenticationDAO {
    
    public static Funcionario getAuthentication(Funcionario funcParam){
        
        //Criando objeto de retorno
        Funcionario returnFunc = new Funcionario();
        
        try{

            //Realizando consulta no banco de Dados
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT IdReg, name, user, password, position, graduation FROM Funcionario WHERE user = '"+ funcParam.getUser() +"' AND password = '"+ funcParam.getPwd() +"';");
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){

                //Capturando os dados do Banco de dados no objeto de retorno
                returnFunc.setIdReg(rs.getInt("IdReg"));
                returnFunc.setName(rs.getString("name"));
                returnFunc.setUser(rs.getString("user"));
                returnFunc.setPwd(rs.getString("password"));
                returnFunc.setPosition(rs.getString("Position"));
                returnFunc.setGraduation(rs.getString("graduation"));
                
            } 

            con.close();
        }catch(SQLException e){
            System.out.println("Error: " + e );
        }
        
        //Retornando objeto populado
        return returnFunc;
    }
    
}
