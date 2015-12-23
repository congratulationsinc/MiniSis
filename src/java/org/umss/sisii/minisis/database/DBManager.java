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
import java.util.List;
import java.util.ArrayList;
import org.umss.sisii.minisis.model.Task;

/**
 *
 * @author PC_
 */
public class DBManager {

    private Connection connection = null;
    private ResultSet rs = null;
    private Statement s = null;
    private static DBManager manager = null;
    private final String url;
    private final String password;
    private final String postgresUser;

    private DBManager() {
        url = "jdbc:postgresql://localhost:5432/MiniSiss";
        password = "julio";
        postgresUser = "postgres";
        conectar();
    }

    public static DBManager getInstance() {
        if (manager == null) {
            manager = new DBManager();
        }
        return manager;
    }

    private void conectar() {
        if (connection != null) {
            return;
        }
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(url, postgresUser, password);
            if (connection != null) {
                s = connection.createStatement();
                System.out.println("Conectando a Base de Datos...");
            }
        } catch (Exception e) {
            System.out.println("Problemas de Conexion");
        }
    }

    public boolean checkUser(String user, String password) {
        boolean isCorrect = false;
        try {
            rs = s.executeQuery("SELECT password FROM \"USER\" WHERE user_name = '" + user + "';");
            while (rs.next()) {
                isCorrect = (rs.getString("password")).equals(password);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }

        return isCorrect;
    }

    public List<Task> getAllTasks() {
        List<Task> tasks = new ArrayList<Task>();
        try {
            rs = s.executeQuery("SELECT task_name, task_description, start_date, end_date FROM \"task\";");
            while (rs.next()) {
                Task task = new Task();
                task.setTaskName(rs.getString("task_name"));
                task.setDescription(rs.getString("task_description"));
                task.setStartDate(rs.getString("start_date"));
                task.setEndDate(rs.getString("end_date"));
                tasks.add(task);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tasks;
    }
}
