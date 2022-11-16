
package controller;

//Imports para o SQL
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//Imports utilitarios
import java.util.ArrayList;
import java.util.List;

//Imports modulos da aplicação
import database.ConnectDB;
import model.Funcionario;


public class FuncionarioDAO {
    
    //Função responsável por resgatar todos os dados de todos os funcionarios no Banco de Dados
    public static List<Funcionario> getAllEmployee(){

        //Criação de lista de funcionários
        List<Funcionario> list = new ArrayList<>();

        try {
            
            // Abrindo conexão com o banco de Dados e preparando a query
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM funcionarios;");
            ResultSet rs = ps.executeQuery();

            //Percorrendo o ResultSet para gravar os dados em um objeto Funcionario
            while(rs.next()){

                //Instanciando o Funcionario
                Funcionario employee = new Funcionario();

                // Settando todos os atributos do funcionario
                employee.setIdReg(rs.getInt("IdReg"));
                employee.setName(rs.getString("Name"));
                employee.setRG(rs.getString("RG"));
                employee.setCPF(rs.getString("CPF"));
                employee.setBirthDate(rs.getDate("BirthDate"));
                employee.setMobilePhone(rs.getString("MobilePhone"));
                employee.setPhone(rs.getString("Phone"));
                employee.setMail(rs.getString("Mail"));
                employee.setAddress(rs.getString("Address"));
                employee.setCity(rs.getString("City"));
                employee.setUF(rs.getString("UF"));
                employee.setPosition(rs.getString("Position"));

                // Adicionando o funcionario resgatado do banco na lista de funcionarios
                list.add(employee);
            }

            //Fechando conexão com o Banco de Dados
            con.close();

        } catch (SQLException e) {
            System.out.println(e);
        }
        //Retornando a lista de funcionarios 
        return list;
    }

    //Função responsável por resgatar todos os dados de um funcionário baseado no ID
    public static Funcionario getOneEmployeeById(int IdReg){

        //Criando objeto Funcionario de retorno
        Funcionario func = new Funcionario();

        try {

            //Criando conexão com o Banco de Dados e preparando a Query
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("CALL sp_getOneEmployeeById (" + IdReg +");");
            ResultSet rs = ps.executeQuery();

            //Pegando os resultados e setando o objeto Funcionário
            while(rs.next()){
                func.setIdReg(rs.getInt("IdReg"));
                func.setName(rs.getString("name"));
                func.setRG(rs.getString("RG"));
                func.setCPF(rs.getString("CPF"));
                func.setBirthDate(rs.getDate("BirthDate"));
                func.setMobilePhone(rs.getString("MobilePhone"));
                func.setPhone(rs.getString("Phone"));
                func.setMail(rs.getString("Mail"));
                func.setAddress(rs.getString("Address"));
                func.setCity(rs.getString("City"));
                func.setUF(rs.getString("UF"));
                func.setPosition(rs.getString("Position"));
            }
            //Fechando conexão com o Banco de Dados
            con.close();

        } catch (SQLException e) {
            System.out.println("Erro: " + e);
        }

        //Retorno Objeto Funcionário
        return func;
    }

    
    //Função responsável por Inserir Registros no Banco de Dados 
    public static void newEmployee(String name, String RG, String CPF, String birthDate, String Mobile, String Phone, String Mail, String Address, String City, String UF, String Position){

        try {

            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("CALL sp_newEmployee('"+ name + "','" + RG + "','" + CPF + "','" + birthDate + "','" + Mobile + "','" + Phone + "','" + Mail + "','" + Address + "','" + City + "','" + UF + "','" + Position + "');");
            ps.execute();
            con.close();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }


}
