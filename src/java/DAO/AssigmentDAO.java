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
import java.sql.SQLException;



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
}
