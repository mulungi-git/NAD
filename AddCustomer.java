package Customer;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author bryan
 */
public class AddCustomer extends HttpServlet {
    
    private final String jdbcURL = "jdbc:mysql://localhost:3306/shop";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";
    private final String jdbcDriver = "com.mysql.jdbc.Driver";
    private final String table = "customers"; 
    Connection connection = null;
    
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/customer_form.jsp").forward(request,response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                      
            String name = request.getParameter("name");
            String location = request.getParameter("location");
            String preferences = request.getParameter("preferences");
            String gender = request.getParameter("gender");

            
            
//            JspWriter out=JspContext.getOut();
            PrintWriter out = response.getWriter();
            try{
                // Load the database driver
                Class.forName(jdbcDriver);

                  // Get a Connection to the database

                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword); 

                  //Select the data from the database

                String sql = "INSERT INTO "+ table +"" +
                    "  (name, location, preferences, gender) VALUES " +
                    " (?, ?, ?, ?);";
			
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, location);  
                preparedStatement.setString(3, preferences);
                preparedStatement.setString(4, gender);
                
                
				
                int i = preparedStatement.executeUpdate();  
                if(i>0){
//                        out.println("<h1 style='color:green;'>customer added successfully</h1>");
//                        out.println("<h3><a href='home'>back</a></h3>");
                        
//                        request.getRequestDispatcher("AllCustomers").forward(request,response);
                        
                        RequestDispatcher dispatcher = getServletContext()
                            .getRequestDispatcher("/AllCustomers");
                          dispatcher.forward(request, response);
                        
                        
                }
            }catch(ClassNotFoundException | SQLException e){

                    System.out.println("Exception is ;"+e);

            }

    }
    
}

