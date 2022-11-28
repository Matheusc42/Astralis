/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import model.Funcionario;
import model.Classe;

import database.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class AssigmentDAO {
    
    public static void newAssigment(Classe classeParam, Funcionario funcParam){

        try{

            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO atribuicao (IdFuncFK, IdClasseFK) VALUES(" + funcParam.getIdReg() + ", " + classeParam.getIdReg() + ");");

            ps.execute();
            con.close();
        } catch(SQLException e){
            System.out.println("Error: " + e);
        }

    }

    public static List<Funcionario> getAssignedDocente(Classe classeParam){

        //Criando lista de retorno
        List<Funcionario> listReturn = new ArrayList<>();
        
        try {
            
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT func.name, func.graduation from atribuicao as atr INNER JOIN funcionario as func on func.IdReg = atr.IdFuncFK INNER JOIN Classe as class on class.IdReg = atr.IdClasseFK WHERE class.IdReg =" + classeParam.getIdReg() + " ORDER BY graduation;");
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                
                //Criando Funcionario de retorno
                Funcionario returnFunc = new Funcionario();

                returnFunc.setName(rs.getString("name"));
                returnFunc.setGraduation(rs.getString("graduation"));

                listReturn.add(returnFunc);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        return listReturn;
    }
}
