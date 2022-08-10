/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.business.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author bryan
 */
public class AllCustomers extends HttpServlet {

    
    
    private final String jdbcURL = "jdbc:mysql://localhost:3306/business?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";
    private final String jdbcDriver = "com.mysql.cj.jdbc.Driver";
    private final String table = "customers"; 
    Connection connection = null;
        
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
    
        PrintWriter out = response.getWriter();
        try{
            // Load the database driver

            Class.forName(jdbcDriver);

            // Get a Connection to the database

            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword); 

            //Select the data from the database

            String sql = "SELECT * FROM "+table;

            Statement s = connection.createStatement();

            s.executeQuery (sql);

            ResultSet  rs = s.getResultSet();
            
             out.println("<a href='AllProducts'>shop product</a>");
            
            
            out.println("<a href='new_customer'>add customer</a>");
            
            out.println("<table border=1 >");  
                out.println("<tr><th>name</th><th>location</th><th>preferences</th><th>gender</th><tr>");  
                while (rs.next()) {  
                    String name = rs.getString("name");  
                    String location = rs.getString("location");
                    String preferences = rs.getString("preferences");
                    String gender = rs.getString("gender");
                    out.println("<tr><td>" + name + "</td><td>" + location + "</td><td>" + preferences + "</td><td>" + gender + "</td></tr>");   
                }  
            out.println("</table>");
            
           
            
            rs.close ();

            s.close ();
            
        }catch(ClassNotFoundException | SQLException e){

                System.out.println("Exception is ;"+e);

        }
    }


}
