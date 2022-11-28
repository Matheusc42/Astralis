package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import database.ConnectDB;
import model.Boletim;
import model.Funcionario;
import model.Aluno;


/**
 *
 * @author sfcma
 */
public class BoletimDAO {
    
    public static List<Boletim> getAllStudentSchoolReportByOneFunc(Aluno alunoParam, Funcionario funcParam){
        //Criando lista de retorno
        List<Boletim> returnList = new ArrayList<>();
        
        
        try {
            
            //Conectando ao banco de dados para coletar as classes
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Boletim WHERE IdAlunoFk = "+ alunoParam.getRM() +" AND IdFuncFK = "+funcParam.getIdReg()+";");
            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                //Criando objeto classe e setando atributos para adicionar na lista
                Boletim returnBoletim = new Boletim();

                returnBoletim.setIdReg(rs.getInt("IdReg"));
                returnBoletim.setFkFunc(rs.getInt("IdFuncFK"));
                returnBoletim.setFkAluno(rs.getInt("IdAlunoFK"));
                returnBoletim.setN1(rs.getInt("N1"));
                returnBoletim.setN2(rs.getInt("N2"));
                returnBoletim.setN3(rs.getInt("N3"));
                returnBoletim.setNF(rs.getInt("NF"));
                returnBoletim.setF(rs.getInt("F"));
                returnBoletim.setPeriodo(rs.getString("Periodo"));
                

                //Adicionar objeto de retorno na lista
                returnList.add(returnBoletim);

            }

            
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        return returnList;
    }

    public static List<Boletim> getAllStudentSchoolReport(Aluno alunoParam){
        
        //Criando lista de retorno
        List<Boletim> returnList = new ArrayList<>();
        
        
        try {
            
            //Conectando ao banco de dados para coletar as classes
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Boletim WHERE IdAlunoFk = "+ alunoParam.getRM() +" ORDER BY Periodo;");
            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                //Criando objeto classe e setando atributos para adicionar na lista
                Boletim returnBoletim = new Boletim();

                returnBoletim.setIdReg(rs.getInt("IdReg"));
                returnBoletim.setFkFunc(rs.getInt("IdFuncFK"));
                returnBoletim.setFkAluno(rs.getInt("IdAlunoFK"));
                returnBoletim.setN1(rs.getInt("N1"));
                returnBoletim.setN2(rs.getInt("N2"));
                returnBoletim.setN3(rs.getInt("N3"));
                returnBoletim.setNF(rs.getInt("NF"));
                returnBoletim.setF(rs.getInt("F"));
                returnBoletim.setPeriodo(rs.getString("Periodo"));
                

                //Adicionar objeto de retorno na lista
                returnList.add(returnBoletim);

            }

            
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        return returnList;
    }

    public static void newStudentSchoolReport(Boletim boletimParam){
         //Conectando ao banco de dados para realizar o insert

         try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO Boletim (IdFuncFK, IdAlunoFK, N1, N2, N3, NF, F, Periodo) VALUES ("+boletimParam.getFkFunc()+","+boletimParam.getFkAluno()+","+boletimParam.getN1()+","+boletimParam.getN2()+","+boletimParam.getN3()+","+boletimParam.getNF()+","+boletimParam.getF()+",'"+boletimParam.getPeriodo()+"');");
            
            ps.execute();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
    }

    public static void updateReportSchool(Boletim boletimParam){
        //Conectando ao banco de dados para realizar o insert

        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE Boletim SET N1 = "+boletimParam.getN1()+", N2 = "+boletimParam.getN2()+", N3 = "+boletimParam.getN3()+", NF = "+boletimParam.getNF()+", F = "+boletimParam.getF()+", Periodo = '"+boletimParam.getPeriodo()+"' WHERE IdReg = "+boletimParam.getIdReg()+";");
            
            ps.execute();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
    }
}
