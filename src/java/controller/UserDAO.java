
package controller;

//Imports para SQL
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//Imports modulos personalizados
import database.ConnectDB;
import model.User;


public class UserDAO {
    
    public static User getAuthentication(String user, String pwd){

        User userAuth = new User();
        
        try {
            Connection con = ConnectDB.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT user, password, role FROM user WHERE user = '" + user + "' AND password = '" + pwd + "';");
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                userAuth.setUser(rs.getString("user"));
                userAuth.setPwd(rs.getString("password"));
                userAuth.setRole(rs.getString("role"));

            }
        } catch (SQLException e) {
            System.out.println("ERROR: " + e);
        }
        
        return userAuth;
        
    }
    
}
