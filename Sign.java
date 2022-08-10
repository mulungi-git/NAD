/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Customer;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author HP
 */
public class Sign extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        String n = request.getParameter("username");
        String p = request.getParameter("password");
        
        PrintWriter out = response.getWriter();
   try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/shop", "root", "");
            
            PreparedStatement ps = con.prepareStatement("select * from customerdetails where username=? and password=?");
            ps.setString(1, n);
            ps.setString(2,p);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
                RequestDispatcher rd = request.getRequestDispatcher("Dashboard.jsp");
                rd.forward(request, response);
            }else{
                out.println("<a href='Login.jsp'>Try again</a>");
            }
            
                    } catch (ClassNotFoundException | SQLException ex) {
                        out.println(ex.getMessage());
        }


}
}