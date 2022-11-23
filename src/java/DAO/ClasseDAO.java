/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import database.ConnectDB;
import model.Classe;


public class ClasseDAO {
    
    public static List<Classe> getAllClasses(){
        
        //Criando lista de retorno
        List<Classe> returnList = new ArrayList<>();
        
        
        try {
            
            //Conectando ao banco de dados para coletar as classes
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM classe;");
            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                //Criando objeto classe e setando atributos para adicionar na lista
                Classe returnClass = new Classe();

                returnClass.setIdReg(rs.getInt("IdReg"));
                returnClass.setName(rs.getString("Name"));
                returnClass.setSchoolYear(rs.getString("SchoolYear"));

                //Adicionar objeto de retorno na lista
                returnList.add(returnClass);

            }

            
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        return returnList;
    }
    
    public static Classe getOneClasseById(Classe classeParam){

        //Criando objeto de retorno
        Classe returnClass = new Classe();

        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Classe WHERE IdReg=" + classeParam.getIdReg() + ";");
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                returnClass.setIdReg(rs.getInt("IdReg"));
                returnClass.setName(rs.getString("Name"));
                returnClass.setSchoolYear(rs.getString("SchoolYear"));
            }

            con.close();
            
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        return returnClass;
    }
}
