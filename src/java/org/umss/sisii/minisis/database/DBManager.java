package org.umss.sisii.minisis.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.umss.sisii.minisis.model.Task;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Alexandra
 */
public class DBManager {

    private Connection connection = null;
    private ResultSet rs = null;
    private Statement s = null;
    private static DBManager manager = null;
    
    private DBManager(){
        conectar();
    }
    
    public static DBManager getInstance(){
        if(manager == null) {
         manager = new DBManager();
      }
      return manager;
    }
   
    private void conectar(){
    if(connection != null){
            return;
        }  
        String url = "jdbc:postgresql://localhost:5432/MiniSiss";
        String password = "postgresql";
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(url, "postgres", password);
            if(connection != null){
            System.out.println("Conectando a Base de Datos...");
            }
        } catch (Exception e) {
            System.out.println("Problemas de Conexion");
        }
    }
    
    
    public boolean existsUser(String user){
        boolean found = false;
        try {
            //conectar();
            s = connection.createStatement();
            rs = s.executeQuery("SELECT user_name FROM \"USER\";");
            while(rs.next() && !found){
                found = ( rs.getString("user_name") ).equals(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return found;
    }
    
   public boolean checkPassword(String user, String password){
       boolean isCorrect = false;
       if(existsUser(user)){
           try {
            //conectar();
            s = connection.createStatement();
            rs = s.executeQuery("SELECT password FROM \"USER\" WHERE user_name = '"+ user +"';");
            while(rs.next() && !isCorrect){
                isCorrect = ( rs.getString("password") ).equals(password);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
       }
       return isCorrect;
   }

    public List<Task> getAllTasks() {
        return null;
    }
}
