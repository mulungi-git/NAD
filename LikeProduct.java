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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author bryan
 */
public class LikeProduct extends HttpServlet {

    private final String jdbcURL = "jdbc:mysql://localhost:3306/business?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";
    private final String jdbcDriver = "com.mysql.cj.jdbc.Driver";
    private final String table = "customers"; 
    Connection connection = null;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String name = request.getParameter("name");
            
            System.out.println(name);  
            
            try{
                // Load the database driver

                Class.forName(jdbcDriver);

                // Get a Connection to the database

                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                
                //Select the logged in user from the database
                String sql = "SELECT * FROM "+table+" WHERE id=27";

                Statement s = connection.createStatement();

                s.executeQuery (sql);

                ResultSet  rs = s.getResultSet();
                
                
                String currentPreferencesString = "";
                 
                
                while (rs.next()) {
                    String preferences = rs.getString("preferences");
                    
                    currentPreferencesString = preferences;
                }
                
                
                
                String sql2 = "UPDATE customers SET preferences = ? WHERE id = ?";
			  
                PreparedStatement preparedStatement = connection.prepareStatement(sql2);
                preparedStatement.setString(1, currentPreferencesString + name + ",");
	            
	            
                int i = preparedStatement.executeUpdate();
                    if(i>0){
                        out.println("<div class='container text-center d-flex justify-content-center align-items-center' style='height: 100vh'>");
                                        out.println("<div>");
                        out.println("<h1 class='text-success'>product liked successfully</h1><br>");
                        out.println("<a class='text-decoration-none' href='AllProducts'><button class='btn btn-primary'>back to products</button></a>");
                                        out.println("</div>");
                        out.println("</div>"); 
                }
                
                rs.close ();

                s.close ();
                


            }catch(ClassNotFoundException | SQLException e){

                    System.out.println("Exception is ;"+e);

            }
            
            
        }
    }

}
